import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.Scanner;


/**
 * This example demonstrates how to add a domain using the server API.
 */
public class CreateDomainExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String GET_SERVER_PARAMETERS_URI = "/rest/management/server/parameters";
    private static final String ADD_DOMAIN_URI = "/rest/management/domains";
    private static final String START_DOMAIN_URI_TEMPLATE = "/rest/management/domains/%s/start";

    private static final String LOGIN_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String DOMAIN_TEMPLATE =
            "{\"name\":\"%s\","
            + "\"serviceDescriptors\":[%s]}";

    private static final String FTP_SERVICE_TEMPLATE =
            "{\"protocol\":\"FTP\","
            + "\"host\":\"%s\","
            + "\"port\":%s,"
            + "\"type\":\"%s\","
            + "\"keyAlias\":\"%s\"}";

    private static final String FILE_LOG_SERVICE_TEMPLATE =
            "{\"type\":\"FILE\","
            + "\"directory\":\"%s\","
            + "\"strategyName\":\"%s\","
            + "\"fileSize\":%s"
            + "}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CHARSET = "UTF-8";

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String logDir;
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
        CreateDomainExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to add a domain using the server API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static CreateDomainExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");
        String logDir = getParameter("Enter log files directory path (e.g. c:\\logs): ");

        return new CreateDomainExample(host,
                                       port,
                                       username,
                                       password,
                                       domainName,
                                       logDir);
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
     * @param logDir log files directory path
     */
    public CreateDomainExample(String host,
                              int port,
                              String username,
                              String password,
                              String domainName,
                              String logDir) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.logDir = logDir;
    }

    /**
     * Creates domain and adds to server.
     */
    public void execute() {
        try {
            receiveCsrfToken();
            login();

            List<String> allowedServiceDescriptors = getAllowedServiceDescriptors();
            String descriptorString = domainDescriptorStirngFor(allowedServiceDescriptors);

            receiveCsrfTokenAgain();
            addDomain(descriptorString);

            // start domain required for making all services alive
            startDomain();

            logout();

            System.out.println("Domain created successfully!");
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

            String authenticationString = String.format(LOGIN_TEMPLATE, this.username, this.password);
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
     * Obtains server license.
     *
     * @return the server license
     *
     * @throws Exception if an error occurs
     */
    private List<String> getAllowedServiceDescriptors()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, GET_SERVER_PARAMETERS_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoInput(true);
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            if (connection.getResponseCode() != 200) {
                throw new Exception(String.format("HTTP request error. Response code: %d", connection.getResponseCode()));
            }

            Map parameters = deserialize(connection.getInputStream());
            return (List<String>) parameters.get("allowedDescriptors");
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Adds the domain to the server.
     *
     * @param descriptorString the domain descriptor string
     *
     * @throws Exception if an error occurs
     */
    private void addDomain(String descriptorString)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, ADD_DOMAIN_URI, null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("PUT");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            byte[] domainData = descriptorString.getBytes(CHARSET);
            connection.setRequestProperty("Content-Length", Integer.toString(domainData.length));

            OutputStream out = connection.getOutputStream();
            out.write(domainData);
            out.close();

            assertRequestSucceeded(connection);
        } finally {
            connection.disconnect();
        }
    }

    /**
     * Starts the domain.
     *
     * @throws Exception if an error occurs
     */
    private void startDomain()
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, String.format(START_DOMAIN_URI_TEMPLATE, this.domainName), null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            assertRequestSucceeded(connection);
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
        int code = connection.getResponseCode();
        if (code < 200 || code >= 300) {
            throw new Exception(String.format("HTTP request error. Response code: %d", code));
        }
    }

    /**
     * Creates a domain descriptor depended from the license type.
     *
     * @param allowedServiceDescriptors allowed service descriptors
     *
     * @return a new domain descriptor string
     */
    private String domainDescriptorStirngFor(List<String> allowedServiceDescriptors) {
        StringBuilder buffer = new StringBuilder();

        buffer.append(createFtpServiceDescriptorString());
        buffer.append(",");
        buffer.append(createFileLogServiceDescriptorString());

        return String.format(DOMAIN_TEMPLATE, this.domainName, buffer.toString());
    }

    /**
     * Restores server parameters from the JSON string.
     *
     * @param in the input stream
     *
     * @return the server parameters
     *
     * @throws Exception if an error occurs
     */
    private Map deserialize(InputStream in)
            throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        return mapper.readValue(in, Map.class);
    }

    /**
     * Creates a FPT service descriptor string.
     *
     * @return a FPT service descriptor string
     */
    private String createFtpServiceDescriptorString() {
        String host = "0.0.0.0";
        int port = 21;
        String type = "regular";
        String keyAlias = "";

        return String.format(FTP_SERVICE_TEMPLATE,
                             host,
                             port,
                             type,
                             keyAlias);
    }

    /**
     * Creates a file log service descriptor string.
     *
     * @return a file log service descriptor string
     */
    private String createFileLogServiceDescriptorString() {
        String directory = adjustRealPath(this.logDir);
        String strategy = "Daily";
        long maxFileSize = 10485760L;

        return String.format(FILE_LOG_SERVICE_TEMPLATE,
                             directory,
                             strategy,
                             maxFileSize);
    }

    /**
     * Escapes possible back slashes in the real path.
     *
     * @param path a path to adjust
     *
     * @return adjusted real path
     */
    private String adjustRealPath(String path) {
        return path.replace("\\", "\\\\");
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
