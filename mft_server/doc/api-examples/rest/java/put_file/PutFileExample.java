import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

/**
 * This example demonstrates how to upload a file using the server REST API.
 */
public class PutFileExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/csrf-token";
    private static final String LOGIN_URI = "/rest/login";
    private static final String LOGOUT_URI = "/rest/logout";
    private static final String UPLOAD_URI = "/rest/files";
    private static final String UPLOAD_QUERY_STRING_TEMPLATE = "directory=%s&offset=0";

    private static final String CREDENTIALS_TEMPLATE = "{\"domain\":\"%s\",\"username\":\"%s\", \"password\":\"%s\"}";
    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CR_LF = "\r\n";
    private static final Charset CHARSET = StandardCharsets.UTF_8;

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String remoteDirectoryPath;
    private final File localFile;
    private String sessionId;
    private String csrfToken;

    /**
     * The application entry point.
     *
     * @param arguments command line arguments
     * @throws Exception if an error occurs
     */
    public static void main(String[] arguments)
            throws Exception {
        showExampleTitle();
        PutFileExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to upload a file using the server REST API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static PutFileExample createExample()
            throws Exception {
        String host = getParameter("Enter server HTTP/S host: ");
        int port = Integer.parseInt(getParameter("Enter server HTTP/S port: "));
        String username = getParameter("Enter username: ");
        String password = getParameter("Enter password: ");
        String domainName = getParameter("Enter domain name: ");
        String remotePath = getParameter("Enter remote directory path: ");
        String localPath = getParameter("Enter local file path: ");

        return new PutFileExample(host, port, username, password, domainName, remotePath, localPath);
    }

    /**
     * Support method. Shows prompt on console and reads user response.
     *
     * @param prompt prompt string
     * @return user response
     * @throws Exception if an I/O error occurs
     */
    private static String getParameter(String prompt)
            throws Exception {
        System.out.print(prompt);
        return CONSOLE_READER.readLine();
    }

    /**
     * Constructs example.
     *
     * @param host server REST host
     * @param port server REST port
     * @param username server username
     * @param password server password
     * @param domainName domain name
     * @param remoteDirectoryPath the remote directory path
     * @param localFilePath the local file path
     */
    public PutFileExample(String host,
                          int port,
                          String username,
                          String password,
                          String domainName,
                          String remoteDirectoryPath,
                          String localFilePath) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.remoteDirectoryPath = remoteDirectoryPath;
        this.localFile = new File(localFilePath);
    }

    /**
     * Starts domain.
     */
    public void execute() {
        try {
            login();
            receiveCsrfToken();
            uploadFile();
            logout();

            System.out.println("File uploaded successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Performs server login.
     *
     * @throws Exception if an error occurs
     */
    private void login()
            throws Exception {
        byte[] authentication = String.format(CREDENTIALS_TEMPLATE, this.domainName, this.username, this.password).getBytes(CHARSET);
        URL url = new URI(SCHEME, null, this.host, this.port, LOGIN_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Content-Length", Integer.toString(authentication.length));
            connection.setDoOutput(true);

            try (OutputStream out = connection.getOutputStream()) {
                out.write(authentication);
            }

            assertRequestSucceeded(connection);

            String cookie = connection.getHeaderField("Set-Cookie");
            this.sessionId = new Scanner(cookie).useDelimiter(";").next();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Receives CSRF token.
     *
     * @throws Exception if an error occurs
     */
    private void receiveCsrfToken()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, CSRF_TOKEN_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setDoInput(true);

            assertRequestSucceeded(connection);

            StringBuilder builder = new StringBuilder();

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    builder.append(line);
                }
            }

            this.csrfToken = builder.toString();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Downloads the file.
     *
     * @throws Exception if an error occurs
     */
    private void uploadFile()
            throws Exception {
        String queryString = String.format(UPLOAD_QUERY_STRING_TEMPLATE, this.remoteDirectoryPath);
        URL url = new URI(SCHEME, null, this.host, this.port, UPLOAD_URI, queryString, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setRequestMethod("PUT");
            connection.setRequestProperty("Cookie", this.sessionId);
            protectAgainstCsrf(connection);
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setInstanceFollowRedirects(false);

            String boundary = Long.toHexString(System.currentTimeMillis());
            connection.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            connection.setChunkedStreamingMode(1024);

            try (OutputStream out = connection.getOutputStream()) {
                PrintWriter writer = new PrintWriter(new OutputStreamWriter(out, StandardCharsets.UTF_8), true);
                writeFilePart(writer, out, boundary);
                writer.printf("--%s--", boundary).append(CR_LF);

                out.flush();
            }

            assertRequestSucceeded(connection);
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Performs server logout.
     *
     * @throws Exception if an error occurs
     */
    private void logout()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, LOGOUT_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            protectAgainstCsrf(connection);
            connection.setInstanceFollowRedirects(false);

            connection.connect();
            connection.getResponseCode();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Asserts that request was successful.
     *
     * @param connection target connection
     *
     * @throws Exception if an error occurs
     */
    private void assertRequestSucceeded(HttpURLConnection connection)
            throws Exception {
        if (connection.getResponseCode() > 299) {
            throw new Exception(String.format("HTTP request error. Response code: %d", connection.getResponseCode()));
        }
    }

    /**
     * Writes request body.
     *
     * @param writer the multi-part body writer
     * @param out the connection stream
     * @param boundary the boundary
     *
     * @throws Exception if an error occurs
     */
    private void writeFilePart(PrintWriter writer, OutputStream out, String boundary)
            throws Exception {
        try (InputStream in = new FileInputStream(this.localFile)) {
            writer.printf("--%s", boundary).append(CR_LF);
            writer.printf("Content-Disposition: form-data; name=\"data\"; filename=\"%s\"", this.localFile.getName()).append(CR_LF);
            writer.printf("Content-Transfer-Encoding: binary").append(CR_LF);
            writer.append(CR_LF).flush();

            byte[] data = new byte[1024];
            int read;
            while ((read = in.read(data)) != -1) {
                out.write(data, 0, read);
            }
            out.flush();

            writer.append(CR_LF).flush();
        }
    }

    /**
     * Sets CSRF token to request.
     *
     * @param connection the connection
     */
    private void protectAgainstCsrf(HttpURLConnection connection) {
        if (this.csrfToken != null && !this.csrfToken.isEmpty()) {
            connection.setRequestProperty(CSRF_TOKEN_NAME, this.csrfToken);
            connection.setRequestProperty("X-Requested-With", "XMLHttpRequest");
        }
    }
}
