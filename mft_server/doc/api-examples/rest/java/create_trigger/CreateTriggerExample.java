import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Scanner;


/**
 * This example demonstrates how to create a trigger based on File Upload event using the server API.
 */
public class CreateTriggerExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String ADD_TRIGGER_URI_TEMPLATE = "/rest/management/triggers/%s";

    private static final String LOGIN_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String TRIGGER_TEMPLATE = "{\"name\":\"%s\","
                                                   + "\"description\":\"%s\","
                                                   + "\"eventType\":\"%s\","
                                                   + "\"expression\":\"%s\","
                                                   + "\"contexts\":[%s],"
                                                   + "\"allowErrorEvent\":false,"
                                                   + "\"enabled\":true}";

    private static final String ACTION_TEMPLATE = "{\"actionClass\":\"%s\","
                                                  + "\"parametersMap\":{\"%s\":\"%s\"}}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CHARSET = "UTF-8";

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private String sessionId;
    private String csrfToken;

    /**
     * Collects information about the account.
     *
     * @param args command line arguments
     *
     * @throws Exception if an error occurs
     */
    public static void main(String[] args)
            throws Exception {
        showExampleTitle();
        CreateTriggerExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to create a trigger based on File Upload event using the server API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     *
     * @throws Exception if an error occurs
     */
    private static CreateTriggerExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");

        return new CreateTriggerExample(host, port, username, password, domainName);
    }

    /**
     * Support method. Shows prompt on console and reads user response.
     *
     * @param prompt prompt string
     *
     * @return user response
     *
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
     * @param host       server REST host
     * @param port       server REST port
     * @param username   server username
     * @param password   server password
     * @param domainName domain name
     */
    public CreateTriggerExample(String host,
                                int port,
                                String username,
                                String password,
                                String domainName) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
    }

    /**
     * Creates trigger and adds to server.
     */
    public void execute() {
        try {
            receiveCsrfToken();
            login();
            receiveCsrfTokenAgain();
            addTrigger(createTriggerString());
            logout();

            System.out.println("Trigger created successfully!");
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
     * Adds a trigger to the domain.
     *
     * @param triggerString the trigger string
     *
     * @throws Exception if an error occurs
     */
    private void addTrigger(String triggerString)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, String.format(ADD_TRIGGER_URI_TEMPLATE, this.domainName), null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            byte[] data = triggerString.getBytes(CHARSET);
            connection.setRequestProperty("Content-Length", Integer.toString(data.length));

            OutputStream out = connection.getOutputStream();
            out.write(data);
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
     * Creates a trigger string.
     *
     * @return a trigger string
     */
    private String createTriggerString() {
        String triggerName = "Test trigger";
        String triggerDescription = "A trigger example.";
        String eventClass = "com.jscape.inet.mft.transport.events.FileUploadEvent";
        String expression = "((Success = true) AND (Name = \\\"test.txt\\\"))";
        String actionData = createActionString();

        return String.format(TRIGGER_TEMPLATE,
                             triggerName,
                             triggerDescription,
                             eventClass,
                             expression,
                             actionData);
    }

    /**
     * Creates an action string.
     *
     * @return an action string
     */
    private String createActionString() {
        String actionClass = "com.jscape.inet.mft.workflow.actions.SystemOutAction";
        String messageParameterName = "Message";
        String messageParameterValue = "File %Name% is successfully uploaded.";

        return String.format(ACTION_TEMPLATE,
                             actionClass,
                             messageParameterName,
                             messageParameterValue);
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
