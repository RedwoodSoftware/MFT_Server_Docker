import com.jscape.inet.mft.management.client.api.ManagerSubsystem;
import com.jscape.inet.vfs.AccessPermissions;
import com.jscape.inet.vfs.Account;
import com.jscape.inet.vfs.VirtualFileDescriptor;
import com.jscape.inet.vfs.VirtualLocalFileDescriptor;
import com.jscape.inet.vfs.PgpEncryption;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This example demonstrates how to add an account using the server API.
 */
public class CreateAccountExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final String domainName;
    private final String accountName;
    private final String userName;
    private final char[] password;
    private final String realPath;
    private final File configFile;
    private ManagerSubsystem manager;

    /**
     * The application entry point.
     *
     * @param arguments command line arguments
     * @throws Exception if an error occurs
     */
    public static void main(String[] arguments)
            throws Exception {
        suppressLogging();
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
        String domainName = getParameter("Enter domain name: ");
        String accountName = getParameter("Enter account real name e.g. John Smith: ");
        String userName = getParameter("Enter account username e.g. jsmith: ");
        String password = getParameter("Enter account password: ");
        String realPath = getParameter("Enter default login directory e.g. C:\\home: ");
        File configFile = getConfigFile();

        return new CreateAccountExample(domainName,
                                        accountName,
                                        userName,
                                        password.toCharArray(),
                                        realPath,
                                        configFile);
    }

    /**
     * Returns a manager configuration file.
     *
     * @return a manager configuration file
     *
     * @throws Exception if an I/O error occurs
     */
    private static File getConfigFile()
            throws Exception {
        File configFile = new File(DEFAULT_CLIENT_CONFIG_FILE);

        while (!configFile.exists()) {
            System.out.println("Configuration file not found.");
            String configFilePath = getParameter("Please enter absolute path of client.cfg file: ");
            configFile = new File(configFilePath);
        }

        return configFile;
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
     * @param domainName  domain name
     * @param accountName account real name
     * @param userName    account username/login
     * @param password    password
     * @param realPath    user login directory
     * @param configFile  config file
     */
    public CreateAccountExample(String domainName, String accountName, String userName, char[] password, String realPath, File configFile) {
        this.domainName = domainName;
        this.accountName = accountName;
        this.userName = userName;
        this.password = password;
        this.realPath = realPath;
        this.configFile = configFile;
    }

    /**
     * Creates account and adds to server.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            Account account = createAccount();
            this.manager.addAccount(this.domainName, account);

            System.out.println("Account created successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
				this.manager.disconnect();
			}
        }
    }

    /**
     * Creates an account.
     *
     * @return an account
     */
    private Account createAccount() {
        VirtualFileDescriptor path = createVirtualFileDescriptor();
        VirtualFileDescriptor[] descriptorList = new VirtualFileDescriptor[]{path};
        
        Date expirationDate = createExpirationDate();

        return new Account(this.accountName,
                           this.userName,
                           this.password,
                           descriptorList,
                           expirationDate);
    }

    /**
     * Creates virtual file descriptor.
     *
     * @return the virtual file descriptor
     */
    private VirtualFileDescriptor createVirtualFileDescriptor() {
        return new VirtualLocalFileDescriptor("/", new AccessPermissions(), this.realPath, true, new PgpEncryption());
    }

    /**
     * Creates expiration date of account to 100 years in the future.
     *
     * @return accoutn expiration date
     */
    private Date createExpirationDate() {
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(Calendar.YEAR);
        calendar.set(Calendar.YEAR, year + 100);

        return calendar.getTime();
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

}
