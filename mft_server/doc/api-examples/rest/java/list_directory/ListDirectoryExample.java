import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

/**
 * This example demonstrates how to list a directory using the server REST API.
 */
public class ListDirectoryExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/csrf-token";
    private static final String LOGIN_URI = "/rest/login";
    private static final String LOGOUT_URI = "/rest/logout";
    private static final String LIST_DIR_URI = "/rest/files/list";
    private static final String LIST_DIR_QUERY_STRING_TEMPLATE = "path=%s";

    private static final String CREDENTIALS_TEMPLATE = "{\"domain\":\"%s\",\"username\":\"%s\", \"password\":\"%s\"}";
    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final Charset CHARSET = StandardCharsets.UTF_8;

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String directoryPath;
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
        ListDirectoryExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to list a directory using the server REST API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static ListDirectoryExample createExample()
            throws Exception {
        String host = getParameter("Enter server HTTP/S host: ");
        int port = Integer.parseInt(getParameter("Enter server HTTP/S port: "));
        String username = getParameter("Enter username: ");
        String password = getParameter("Enter password: ");
        String domainName = getParameter("Enter domain name: ");
        String path = getParameter("Enter directory to list: ");

        return new ListDirectoryExample(host, port, username, password, domainName, path);
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
     * @param directoryPath directory to list
     */
    public ListDirectoryExample(String host,
                                int port,
                                String username,
                                String password,
                                String domainName,
                                String directoryPath) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.directoryPath = directoryPath;
    }

    /**
     * Starts domain.
     */
    public void execute() {
        try {
            login();
            receiveCsrfToken();

            String listing = listDirectory();
            System.out.println(listing);

            logout();
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
     * Lists the directory content.
     *
     * @return directory listing in JSON format
     *
     * @throws Exception if an error occurs
     */
    private String listDirectory()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, LIST_DIR_URI, String.format(LIST_DIR_QUERY_STRING_TEMPLATE, this.directoryPath), null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setInstanceFollowRedirects(false);
            connection.setDoInput(true);

            assertRequestSucceeded(connection);

            return readResponse(connection.getInputStream());
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
     * Reads the response content.
     *
     * @param in the stream
     * @return the response content as string
     *
     * @throws Exception if an error occurs
     */
    private String readResponse(InputStream in)
            throws Exception {
        try (InputStreamReader reader = new InputStreamReader(in, CHARSET)) {
            StringBuilder buffer = new StringBuilder();
            char[] data = new char[1024];
            int read;

            while ((read = reader.read(data)) != -1) {
                buffer.append(data, 0, read);
            }

            return buffer.toString();
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
