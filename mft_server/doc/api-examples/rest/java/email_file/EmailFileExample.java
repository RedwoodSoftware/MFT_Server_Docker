import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

/**
 * This example demonstrates how to email a file using the server REST API.
 */
public class EmailFileExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/csrf-token";
    private static final String LOGIN_URI = "/rest/login";
    private static final String LOGOUT_URI = "/rest/logout";
    private static final String EMAIL_FILE_URI = "/rest/files/email";

    private static final String CREDENTIALS_TEMPLATE = "{\"domain\":\"%s\",\"username\":\"%s\", \"password\":\"%s\"}";
    private static final String EMAIL_DETAILS_TEMPLATE =
            "{\"files\":[\"%s\"],"
            + "\"sender\":\"%s\","
            + "\"recipients\":[\"%s\"],"
            + "\"ccRecipients\":[\"\"],"
            + "\"bccRecipients\":[\"\"],"
            + "\"subject\":\"Test file\","
            + "\"message\":\"This is a test file.\","
            + "\"password\":\"secret\","
            + "\"generateRandomPassword\":true,"
            + "\"expireAfterDays\":1,"
            + "\"maxDownloads\":1,"
            + "\"deleteAfterMaxDownloads\":true,"
            + "\"secure\":false}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final Charset CHARSET = StandardCharsets.UTF_8;

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String filePath;
    private final String sender;
    private final String recipient;
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
        EmailFileExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to email a file using the server REST API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static EmailFileExample createExample()
            throws Exception {
        String host = getParameter("Enter server HTTP/S host: ");
        int port = Integer.parseInt(getParameter("Enter server HTTP/S port: "));
        String username = getParameter("Enter username: ");
        String password = getParameter("Enter password: ");
        String domainName = getParameter("Enter domain name: ");
        String path = getParameter("Enter file path: ");
        String sender = getParameter("Enter sender email: ");
        String recipient = getParameter("Enter recipient email: ");

        return new EmailFileExample(host, port, username, password, domainName, path, sender, recipient);
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
     * @param filePath file to send
     * @param sender the email sender address
     * @param recipient the email recipient address
     */
    public EmailFileExample(String host,
                            int port,
                            String username,
                            String password,
                            String domainName,
                            String filePath,
                            String sender,
                            String recipient) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.filePath = filePath;
        this.sender = sender;
        this.recipient = recipient;
    }

    /**
     * Starts domain.
     */
    public void execute() {
        try {
            login();
            receiveCsrfToken();
            emailFile(createEmailData());
            logout();

            System.out.println("File emailed successfully!");
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
     * Emails the file.
     *
     * @param details the file details string
     *
     * @throws Exception if an error occurs
     */
    private void emailFile(String details)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, EMAIL_FILE_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        byte[] data = details.getBytes(CHARSET);

        try {
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Content-Length", Integer.toString(data.length));
            protectAgainstCsrf(connection);
            connection.setInstanceFollowRedirects(false);
            connection.setDoOutput(true);

            try (OutputStream out = connection.getOutputStream()) {
                out.write(data);
                out.close();
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
     * Creates a details string.
     *
     * @return a details string
     */
    private String createEmailData() {
        return String.format(EMAIL_DETAILS_TEMPLATE, this.filePath, this.sender, this.recipient);
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
