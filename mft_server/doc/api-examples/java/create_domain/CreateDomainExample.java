import com.jscape.inet.mft.management.client.api.ManagerSubsystem;
import com.jscape.inet.mft.management.descriptors.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This example demonstrates how to add a domain using the server API.
 */
public class CreateDomainExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final String DEFAULT_CLIENT_LICENSE_FILE="license.lic";

    private static final String LICENSE_TYPE_IDENTIFIER_KEY="type=";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final String domainName;
    private final String storeDir;
    private final String logDir;
    private final File configFile;
    private ManagerSubsystem manager;

    /**
     * Constructs example.
     *
     * @param domainName domain name
     * @param storeDir   datastore files directory path
     * @param logDir     log files directory path
     * @param configFile config file
     */
    public CreateDomainExample(String domainName, String storeDir, String logDir, File configFile) {
        this.domainName = domainName;
        this.storeDir = storeDir;
        this.logDir = logDir;
        this.configFile = configFile;
    }

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
        String domainName = getParameter("Enter domain name: ");
        String logDir = getParameter("Enter log files directory path (e.g. c:\\logs): ");
        String storeDir = getParameter("Enter datastore files directory path (e.g. c:\\users): ");
        File configFile = getConfigFile();

        return new CreateDomainExample(domainName, storeDir, logDir, configFile);
    }

    /**
     * Returns a manager configuration file.
     *
     * @return a manager configuration file
     * @throws Exception if an I/O error occurs
     */
    private static File getConfigFile()
            throws Exception {
        File configFile = new File(DEFAULT_CLIENT_CONFIG_FILE);

        while (!configFile.exists()) {
            String configFilePath = getParameter("Please enter absolute path of client.cfg file: ");
            configFile = new File(configFilePath);
            if (!configFile.exists()) {
                System.out.println("Configuration file not found.");
            }
        }

        return configFile;
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
     * Creates domain and adds to server.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            // license type will be used for creating a corresponded domain descriptor
            // ServerParameters.LicenseSummary license = this.manager.serverParameters().getLicense();

            DomainDescriptor descriptor = createDomainDescriptor(getLicenseType());
            this.manager.addDomain(descriptor);

            System.out.println("Domain created successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
                this.manager.disconnect();
            }
        }
    }

    /**
     * Creates a domain descriptor depended from the license type.
     *
     * @param licenseType license type
     * @return a new domain descriptor
     */
    private DomainDescriptor createDomainDescriptor(String licenseType) {
        return licenseType.equals("Community")
                ? createCommunityTypeDescriptor()
                : createProfessionalTypeDescriptor();
    }

    /**
     * Creates a Community type descriptor.
     *
     * @return a domain descriptor
     */
    private DomainDescriptor createCommunityTypeDescriptor() {
        DomainDescriptor descriptor = new DomainDescriptor(this.domainName, "");

        descriptor.addServiceDescriptor(new FtpServiceDescriptor("127.0.0.1", 21, FtpServiceDescriptor.REGULAR, ""));
        descriptor.addServiceDescriptor(new FileStoreServiceDescriptor(this.storeDir));
        descriptor.addServiceDescriptor(new FileLogServiceDescriptor(this.logDir, FileLogServiceDescriptor.DAILY_STRATEGY, 0));
        descriptor.addServiceDescriptor(new AccountAuthenticationServiceDescriptor());


        return descriptor;
    }

    /**
     * Creates a Professional type descriptor.
     *
     * @return a domain descriptor
     */
    private DomainDescriptor createProfessionalTypeDescriptor() {
        DomainDescriptor descriptor = new DomainDescriptor(this.domainName, "");

        descriptor.addServiceDescriptor(new FtpServiceDescriptor("127.0.0.1", 21, FtpServiceDescriptor.REGULAR, ""));
        descriptor.addServiceDescriptor(new FileStoreServiceDescriptor(this.storeDir));
        descriptor.addServiceDescriptor(new FileLogServiceDescriptor(this.logDir, FileLogServiceDescriptor.DAILY_STRATEGY, 0));
        descriptor.addServiceDescriptor(new AccountAuthenticationServiceDescriptor());
        descriptor.addServiceDescriptor(new ReportServiceDescriptor());
        descriptor.addServiceDescriptor(new ResourceServiceDescriptor());
        descriptor.addServiceDescriptor(new EventServiceDescriptor());
        descriptor.addServiceDescriptor(new IPAccessServiceDescriptor());
        descriptor.addServiceDescriptor(new DirectoryMonitorServiceDescriptor());

        return descriptor;
    }

    /**
     * Returns type of the license
     *
     * @return license type
     * @throws Exception
     */
    private String getLicenseType() throws Exception {
        String licenseFile = this.configFile.toString().replace(DEFAULT_CLIENT_CONFIG_FILE, DEFAULT_CLIENT_LICENSE_FILE);
        BufferedReader reader = new BufferedReader(new FileReader(licenseFile));
        String line = reader.readLine();
        String licenseType = "";

        while (line != null) {
            line = reader.readLine();
            if (null != line && line.contains(LICENSE_TYPE_IDENTIFIER_KEY)) {
                licenseType = line.replace(LICENSE_TYPE_IDENTIFIER_KEY, "").trim();
                break;
            }
        }

        reader.close();
        return licenseType;
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

}
