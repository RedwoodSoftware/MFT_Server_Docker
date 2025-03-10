import com.jscape.util.Base64Format;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Calendar;
import java.util.Scanner;

/**
 * This example demonstrates how to add an account using the server API.
 */
public class CreateAccountExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String SCHEME = "http";
    private static final String CSRF_TOKEN_URI = "/rest/management/csrf-token";
    private static final String LOGIN_URI = "/rest/management/login";
    private static final String LOGOUT_URI = "/rest/management/logout";
    private static final String ADD_ACCOUNT_URI_TEMPLATE = "/rest/management/accounts/%s";

    private static final String LOGIN_TEMPLATE = "{\"username\":\"%s\", \"password\":\"%s\"}";

    private static final String ACCOUNT_TEMPLATE =
            "{\"username\":\"%s\","
            + "\"login\":\"%s\","
            + "\"passwordHash\":\"%s\","
            + "\"groups\":[],"
            + "\"bindedKeys\":[],"
            + "\"expirationDate\":%s,"
            + "\"resources\":[%s],"
            + "\"secured\":false,"
            + "\"enabled\":true,"
            + "\"passwordChangingAllowed\":false,"
            + "\"emailFileTransferAllowed\":false,"
            + "\"usePhoneAuthentication\":false,"
            + "\"ignorePasswordAgingRules\":false,"
            + "\"passwordResetRequired\":false,"
            + "\"loginRedirection\":{\"target\":\"storage\",\"directory\":\"\"},"
            + "\"ipAccessVerifier\":{\"masks\":[]},"
            + "\"webPublicKeyAuthenticationAvailable\":true,"
            + "\"webOpenPgpEncryptionAvailable\":true,"
            + "\"webQuotasAvailable\":true,"
            + "\"webContactsAvailable\":true,"
            + "\"webAdHocActivityAvailable\":true,"
            + "\"webDropZonesAvailable\":true}";

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
    private final String accountName;
    private final String accountUsername;
    private final String accountPassword;
    private final String accountRealPath;
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
        CreateAccountExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to add an account using the server API.");
        System.out.println();
    }


    /**
     * Creates an example instance.
     *
     * @return an example instance
     *
     * @throws Exception if an error occurs
     */
    private static CreateAccountExample createExample()
            throws Exception {
        String host = getParameter("Enter server REST host: ");
        int port = Integer.parseInt(getParameter("Enter server REST port: "));
        String username = getParameter("Enter REST username: ");
        String password = getParameter("Enter REST password: ");
        String domainName = getParameter("Enter domain name: ");
        String accountName = getParameter("Enter account real name e.g. John Smith: ");
        String accountUsername = getParameter("Enter account username e.g. jsmith: ");
        String accountPassword = getParameter("Enter account password: ");
        String accountrealPath = getParameter("Enter default login directory e.g. C:\\home: ");

        return new CreateAccountExample(host,
                                        port,
                                        username,
                                        password,
                                        domainName,
                                        accountName,
                                        accountUsername,
                                        accountPassword,
                                        accountrealPath);
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
     * @param host server REST host
     * @param port server REST port
     * @param username server username
     * @param password server password
     * @param domainName  domain name
     * @param accountName account real name
     * @param accountUsername    account username/login
     * @param accountPassword    password
     * @param accountRealPath    user login directory
     */
    public CreateAccountExample(String host,
                                int port,
                                String username,
                                String password,
                                String domainName,
                                String accountName,
                                String accountUsername,
                                String accountPassword,
                                String accountRealPath) {
        this.host = host;
        this.port = port;
        this.username = username;
        this.password = password;
        this.domainName = domainName;
        this.accountName = accountName;
        this.accountUsername = accountUsername;
        this.accountPassword = accountPassword;
        this.accountRealPath = accountRealPath;
    }

    /**
     * Creates account and adds to server.
     */
    public void execute() {
        try {
            receiveCsrfToken();
            login();
            receiveCsrfTokenAgain();
            addAccount(createAccountString());
            logout();

            System.out.println("Account created successfully!");
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
     * Adds the account to the domain.
     *
     * @param accountString the account string
     *
     * @throws Exception if an error occurs
     */
    private void addAccount(String accountString)
            throws Exception {
        URL url = new URI(SCHEME, null, this.host, this.port, String.format(ADD_ACCOUNT_URI_TEMPLATE, this.domainName), null, null).toURL();
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Cookie", this.sessionId);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setInstanceFollowRedirects(false);
            protectAgainstCsrf(connection);

            byte[] accountData = accountString.getBytes(CHARSET);
            connection.setRequestProperty("Content-Length", Integer.toString(accountData.length));

            OutputStream out = connection.getOutputStream();
            out.write(accountData);
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
     * Creates an account string.
     *
     * @return an account string
     *
     * @throws Exception if an error occurs
     */
    private String createAccountString()
            throws Exception {
        String passwordHash = createPasswordHash();
        long expirationDate = createExpirationDate();
        String virtualFileDescriptorString = createVirtualFileDescriptorString();

        return String.format(ACCOUNT_TEMPLATE,
                             this.accountName,
                             this.accountUsername,
                             passwordHash,
                             expirationDate,
                             virtualFileDescriptorString);
    }

    /**
     * Creates virtual file descriptor string.
     *
     * @return the virtual file descriptor string
     */
    private String createVirtualFileDescriptorString() {
        String realPath = adjustRealPath();

        return String.format(VIRTUAL_LOCAL_FILE_TEMPLATE,
                             "/",
                             realPath,
                             ACCESS_PERMISSION_TEMPLATE);
    }

    /**
     * Escapes possible back slashes in the real path.
     *
     * @return adjusted real path
     */
    private String adjustRealPath() {
        return this.accountRealPath.replace("\\", "\\\\");
    }

    /**
     * Creates expiration date of account to 100 years in the future.
     *
     * @return accoutn expiration date
     */
    private long createExpirationDate() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        calendar.set(Calendar.YEAR, year + 100);

        return calendar.getTimeInMillis();
    }

    /**
     * Creates a password hash.
     *
     * @return a password hash string
     *
     * @throws Exception if an error occurs
     */
    private String createPasswordHash()
            throws Exception {
        MessageDigest digest = MessageDigest.getInstance("MD5");
        byte[] hash = digest.digest(this.accountPassword.getBytes(CHARSET));
        return Base64Format.formatData(hash);
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
