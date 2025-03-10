import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.Scanner;

/**
 * This example demonstrates how to add a group using the server API.
 */
public class CreateGroupExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String ADD_GROUP_URI_TEMPLATE = "/rest/management/groups/%s";

    private static final String LOGIN_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String GROUP_TEMPLATE = "{\"name\":\"%s\","
                                                 + "\"resources\":[%s]}";

    private static final String VIRTUAL_LOCAL_FILE_TEMPLATE =
            "{\"path\":\"%s\","
            + "\"realPath\":\"%s\","
            + "\"accessPermissions\":%s,"
            + "\"secured\":false,"
            + "\"denied\":false,"
            + "\"indexable\":true,"
            + "\"createIfNotExists\":true,"
            + "\"pgpEncryption\":{\"keyProvider\":{\"file\":\"/.pgp/key.pub\",\"filePassword\":\"\"},\"enabled\":false},"
            + "\"dataLossPrevention\":{\"rules\":[],\"enabled\":false}}";

    private static final String ACCESS_PERMISSION_TEMPLATE = "{\"fileDownloadingAllowed\":true,"
                                                             + "\"fileUploadingAllowed\":true,"
                                                             + "\"fileDeletionAllowed\":true,"
                                                             + "\"fileAppendingAllowed\":true,"
                                                             + "\"fileListingAllowed\":true,"
                                                             + "\"fileRenamingAllowed\":true,"
                                                             + "\"directoriesListingAllowed\":true,"
                                                             + "\"directoryMakingAllowed\":true,"
                                                             + "\"directoryDeletionAllowed\":true,"
                                                             + "\"subdirectoriesBrowsingAllowed\":true}";

    private static final String CSRF_TOKEN_NAME = "x-js-at";
    private static final String CHARSET = "UTF-8";

    private final String host;
    private final int port;
    private final String username;
    private final String password;
    private final String domainName;
    private final String groupName;
    private final String groupVirtualPath;
    private final String groupRealPath;
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
        CreateGroupExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to add a group using the server API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static CreateGroupExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");
        String groupName = getParameter("Enter group name e.g. Accountants: ");
        String groupVirtualPath = getParameter("Enter virtual path e.g. /group: ");
        String groupRealPath = getParameter("Enter default group directory e.g. C:\\home: ");

        return new CreateGroupExample(host,
                                      port,
                                      username,
                                      password,
                                      domainName,
                                      groupName,
                                      groupVirtualPath,
                                      groupRealPath);
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
     * @param groupName  group name
     * @param groupVirtualPath group virtual path
     * @param groupRealPath group real path
     */
    public CreateGroupExample(String host,
                              int port,
                              String username,
                              String password,
                              String domainName,
                              String groupName,
                              String groupVirtualPath,
                              String groupRealPath) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.groupName = groupName;
        this.groupVirtualPath = groupVirtualPath.charAt(0) == '/' ? groupVirtualPath : "/" + groupVirtualPath;
        this.groupRealPath = groupRealPath;
    }

    /**
     * Creates group and adds to server.
     */
    public void execute() {
        try {
            receiveCsrfToken();
            login();
            receiveCsrfTokenAgain();
            addGroup(createGroupString());
            logout();

            System.out.println("Group created successfully!");
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
     * Adds the gorup to the domain.
     *
     * @param groupString the group string
     *
     * @throws Exception if an error occurs
     */
    private void addGroup(String groupString)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, String.format(ADD_GROUP_URI_TEMPLATE, this.domainName), null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            byte[] groupData = groupString.getBytes(CHARSET);
            connection.setRequestProperty("Content-Length", Integer.toString(groupData.length));

            OutputStream out = connection.getOutputStream();
            out.write(groupData);
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
     * Creates a group string.
     *
     * @return a group string
     */
    private String createGroupString() {
        String virtualFileDescriptorString = createVirtualFileDescriptorString();

        return String.format(GROUP_TEMPLATE, this.groupName, virtualFileDescriptorString);
    }

    /**
     * Creates virtual file descriptor string.
     *
     * @return the virtual file descriptor string
     */
    private String createVirtualFileDescriptorString() {
        String realPath = adjustRealPath();

        return String.format(VIRTUAL_LOCAL_FILE_TEMPLATE,
                             this.groupVirtualPath,
                             realPath,
                             ACCESS_PERMISSION_TEMPLATE);
    }

    /**
     * Escapes possible back slashes in the real path.
     *
     * @return adjusted real path
     */
    private String adjustRealPath() {
        return this.groupRealPath.replace("\\", "\\\\");
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
