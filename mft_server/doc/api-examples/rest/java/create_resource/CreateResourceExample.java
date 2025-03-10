import com.jscape.inet.mft.resources.FtpResourceDescriptor;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Scanner;

/**
 * This example demonstrates how to create a FTP network storage using the server API.
 */
public class CreateResourceExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String ADD_PROXY_URI_TEMPLATE = "/rest/management/network-storage/%s";

    private static final String LOGIN_JSON_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String FTP_RESOURCE_JSON_TEMPLATE =
            "{\"protocol\":\"FTP\","
            + "\"name\":\"%s\","
            + "\"host\":\"%s\","
            + "\"port\":%d,"
            + "\"connectionType\":\"%s\","
            + "\"username\":\"%s\","
            + "\"password\":\"%s\","
            + "\"passive\":%s,"
            + "\"usingCredentials\":false,"
            + "\"timeout\":0,"
            + "\"keyProvider\":null,"
            + "\"logDirectory\":null,"
            + "\"timeToLive\":null,"
            + "\"remoteDirectory\":{\"@type\":\"REMOTE\"}}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CHARSET = "UTF-8";

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String resourceName;
    private final String resourceHost;
    private final int resourcePort;
    private final String resourceConnectionType;
    private final String resourceUsername;
    private final String resourcePassword;
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
        CreateResourceExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to create a FTP network storage using the server API.");
        System.out.println();
    }


    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static CreateResourceExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");
        String resourceName = getParameter("Enter network storage name: ");
        String resourceHost = getParameter("Enter network storage hostname: ");
        int resourcePort = Integer.parseInt(getParameter("Enter network storage port: "));

        String resourceConnectionType = "";
        while (!resourceConnectionType.equals(FtpResourceDescriptor.REGULAR)
               && !resourceConnectionType.equals(FtpResourceDescriptor.EXPLICIT_SSL)
               && !resourceConnectionType.equals(FtpResourceDescriptor.IMPLICIT_SSL)) {
            resourceConnectionType = getParameter("Enter network storage type (regular, explicit SSL, implicit SSL): ");
        }

        String resourceUsername = getParameter("Enter network storage username: ");
        String resourcePassword = getParameter("Enter network storage password: ");

        return new CreateResourceExample(host,
                                         port,
                                         username,
                                         password,
                                         domainName,
                                         resourceName,
                                         resourceHost,
                                         resourcePort,
                                         resourceConnectionType,
                                         resourceUsername,
                                         resourcePassword);
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
     * @param resourceName resource name
     * @param resourceHost resource hostname
     * @param resourcePort resource port
     * @param resourceConnectionType resource connection type
     * @param resourceUsername resource username/login
     * @param resourcePassword password
     */
    public CreateResourceExample(String host,
                                 int port,
                                 String username,
                                 String password,
                                 String domainName,
                                 String resourceName,
                                 String resourceHost,
                                 int resourcePort,
                                 String resourceConnectionType,
                                 String resourceUsername,
                                 String resourcePassword) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.resourceName = resourceName;
        this.resourceHost = resourceHost;
        this.resourcePort = resourcePort;
        this.resourceConnectionType = resourceConnectionType;
        this.resourceUsername = resourceUsername;
        this.resourcePassword = resourcePassword;
    }

    /**
     * Creates resource and adds to server.
     */
    public void execute() {
        try {
            receiveCsrfToken();
            login();
            receiveCsrfTokenAgain();
            addResource(createResourceData());
            logout();

            System.out.println("Resource created successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Performs server management login.
     *
     * @throws Exception if an error occurs
     */
    private void login()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, LOGIN_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            String authenticationString = String.format(LOGIN_JSON_TEMPLATE, this.username, this.password);
            byte[] authenticationData = authenticationString.getBytes(CHARSET);

            connection.setRequestProperty("Content-Length", Integer.toString(authenticationData.length));

            OutputStream out = connection.getOutputStream();
            out.write(authenticationData);
            out.close();

            assertRequestSucceeded(connection);

            String cookie = connection.getHeaderField("Set-Cookie");
            this.sessionId = new Scanner(cookie).useDelimiter(";").next();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Performs server management logout.
     *
     * @throws Exception if an error occurs
     */
    private void logout()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, LOGOUT_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            protectAgainstCsrf(connection);

            connection.connect();
            connection.getResponseCode();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Adds the network storage to the domain.
     *
     * @param data the network storage string
     * @throws Exception if an error occurs
     */
    private void addResource(String data)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, String.format(ADD_PROXY_URI_TEMPLATE, this.domainName), null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            byte[] proxyData = data.getBytes(CHARSET);
            connection.setRequestProperty("Content-Length", Integer.toString(proxyData.length));

            OutputStream out = connection.getOutputStream();
            out.write(proxyData);
            out.close();

            assertRequestSucceeded(connection);
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Asserts that request was successful.
     *
     * @param connection target connection
     * @throws Exception if an error occurs
     */
    private void assertRequestSucceeded(HttpURLConnection connection)
            throws Exception {
        int code = connection.getResponseCode();
        if (code < 200 || code >= 300) {
            throw new Exception(String.format("HTTP request error. Response code: %d", code));
        }
    }

    /**
     * Creates a network storage string.
     *
     * @return a network storage String
     */
    private String createResourceData() {
        boolean passive = true;

        return String.format(FTP_RESOURCE_JSON_TEMPLATE,
                             this.resourceName,
                             this.resourceHost,
                             this.resourcePort,
                             this.resourceConnectionType,
                             this.resourceUsername,
                             this.resourcePassword,
                             passive);
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

            String cookie = connection.getHeaderField("Set-Cookie");
            this.sessionId = new Scanner(cookie).useDelimiter(";").next();
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Receives CSRF token again after Login.
     *
     * @throws Exception if an error occurs
     */
    private void receiveCsrfTokenAgain()
            throws Exception{

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
