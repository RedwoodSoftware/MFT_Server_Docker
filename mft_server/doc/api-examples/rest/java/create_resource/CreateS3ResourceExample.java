import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Scanner;

/**
 * @author Hari Prasad
 */
public class CreateS3ResourceExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String ADD_PROXY_URI_TEMPLATE = "/rest/management/network-storage/%s";

    private static final String LOGIN_JSON_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String AMAZON_S3_RESOURCE_JSON_TEMPLATE =
            "{\"protocol\":\"AmazonS3\","
                    + "\"name\":\"%s\","
                    + "\"encryptionType\":\"NONE\","
                    + "\"kmsKeyId\":null,"
                    + "\"authenticationType\":\"%s\","
                    + "\"username\":\"%s\","
                    + "\"password\":\"%s\","
                    + "\"region\":\"%s\","
                    + "\"requesterPaymentRequired\":false,"
                    + "\"usingCredentials\":false,"
                    + "\"logDirectory\":null,"
                    + "\"timeToLive\":null,"
                    + "\"tags\":[],"
                    + "\"host\":\"\","
                    + "\"remoteDirectory\":{\"@type\":\"REMOTE_PATH\", \"path\":\"%s\"}}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CHARSET = "UTF-8";

    /**
     * Authentication types Start
     **/
    private static final String AUTHENTICATION_TYPE_CREDENTIALS = "Credentials";

    private static final String AUTHENTICATION_TYPE_IAM_ROLE = "IAM_Role";

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String resourceName;
    private final String authenticationType;
    private final String s3Key;
    private final String s3Password;
    private final String region;

    private final String remoteDirectory;
    private String sessionId;
    private String csrfToken;

    /**
     * Constructs example.
     *
     * @param host               server REST host
     * @param port               server REST port
     * @param username           server username
     * @param password           server password
     * @param domainName         domain name
     * @param resourceName       resource name
     * @param authenticationType resource authenticationType
     * @param s3Key              resource s3 key
     * @param s3Password         resource s3 password
     * @param region             resource region
     * @param remoteDirectory    resource remote directory
     */
    public CreateS3ResourceExample(String host,
                                   int port,
                                   String username,
                                   String password,
                                   String domainName,
                                   String resourceName,
                                   String authenticationType,
                                   String s3Key,
                                   String s3Password,
                                   String region,
                                   String remoteDirectory) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.resourceName = resourceName;
        this.authenticationType = authenticationType;
        this.s3Key = s3Key;
        this.s3Password = s3Password;
        this.region = region;
        this.remoteDirectory = remoteDirectory;
    }

    /**
     * The application entry point.
     *
     * @param arguments command line arguments
     * @throws Exception if an error occurs
     */
    public static void main(String[] arguments)
            throws Exception {
        showExampleTitle();
        CreateS3ResourceExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to create a Amazon S3 network storage using the server API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static CreateS3ResourceExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");
        String resourceName = getParameter("Enter network storage name: ");

        String s3Key = "";
        String s3Password = "";

        String authenticationType = "";
        System.out.println("1. Credentials");
        System.out.println("2. IAM_Role");
        System.out.println("Select authentication type:");
        int aTypeOption = getOption(1, 2);

        if (aTypeOption == 1) {
            authenticationType = AUTHENTICATION_TYPE_CREDENTIALS;
            s3Key = getParameter("Enter S3 key: ");
            s3Password = getParameter("Enter S3 password: ");
        }

        if (aTypeOption == 2) {
            authenticationType = AUTHENTICATION_TYPE_IAM_ROLE;
        }

        System.out.println("1.  aws-gov-cloud-us");
        System.out.println("2.  us-east-ohio");
        System.out.println("3.  us-east-n-virginia");
        System.out.println("4.  us-west-n-california");
        System.out.println("5.  us-west-orgeon");
        System.out.println("6.  asia-pacific-mumbai");
        System.out.println("7.  asia-pacific-seoul");
        System.out.println("8.  asia-pacific-singapore");
        System.out.println("9.  asia-pacific-sydney");
        System.out.println("10. asia-pacific-tokyo");
        System.out.println("11. canada-central");
        System.out.println("12. europe-frankfurt");
        System.out.println("13. europe-ireland");
        System.out.println("14. europe-london");
        System.out.println("15. europe-paris");
        System.out.println("16. sa-sao-paulo");
        System.out.println("17. cn-beijing");
        System.out.println("18. cn-ningxia");
        System.out.println("Select Region:");

        int regionOption = getOption(1, 18);

        String region = "";

        if (regionOption == 1) {
            region = "us-gov-west-1";
        }
        if (regionOption == 2) {
            region = "us-east-2";
        }
        if (regionOption == 3) {
            region = "us-east-1";
        }
        if (regionOption == 4) {
            region = "us-west-1";
        }
        if (regionOption == 5) {
            region = "us-west-2";
        }
        if (regionOption == 6) {
            region = "ap-south-1";
        }
        if (regionOption == 7) {
            region = "ap-northeast-2";
        }
        if (regionOption == 8) {
            region = "ap-southeast-1";
        }
        if (regionOption == 9) {
            region = "ap-southeast-2";
        }
        if (regionOption == 10) {
            region = "ap-northeast-1";
        }
        if (regionOption == 11) {
            region = "ca-central-1";
        }
        if (regionOption == 12) {
            region = "eu-central-1";
        }
        if (regionOption == 13) {
            region = "eu-west-1";
        }
        if (regionOption == 14) {
            region = "eu-west-2";
        }
        if (regionOption == 15) {
            region = "eu-west-3";
        }
        if (regionOption == 16) {
            region = "sa-east-1";
        }
        if (regionOption == 17) {
            region = "cn-north-1";
        }
        if (regionOption == 18) {
            region = "cn-northwest-1";
        }


        String remoteDirectory = getParameter("Enter remote directory: ");


        return new CreateS3ResourceExample(host,
                port,
                username,
                password,
                domainName,
                resourceName,
                authenticationType,
                s3Key,
                s3Password,
                region,
                remoteDirectory);
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
     * Support method. Shows prompt on console and select the option from user response.
     *
     * @param low
     * @param high
     * @return user response
     * @throws Exception
     */

    private static int getOption(int low, int high) throws Exception {
        int value = Integer.parseInt(CONSOLE_READER.readLine());
        while (value < low || value > high) {
            System.out.println("Invalid choice select between " + low + " and " + high + ": ");
            System.out.println("Select option:");
            value = Integer.parseInt(CONSOLE_READER.readLine());
        }
        return value;
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

            System.out.println("Amazon S3 Resource created successfully!");
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
        return String.format(AMAZON_S3_RESOURCE_JSON_TEMPLATE,
                this.resourceName,
                this.authenticationType,
                this.s3Key,
                this.s3Password,
                this.region,
                this.remoteDirectory);
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
