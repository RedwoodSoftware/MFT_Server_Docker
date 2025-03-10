import com.jscape.inet.mft.management.client.api.ManagerSubsystem;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This example demonstrates how to start a domain using the server API.
 */
public class StartDomainExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final String domainName;
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
        StartDomainExample example = createExample();
        example.execute();
    }

    /**
     * Shows example title.
     */
    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to start a domain using the server API.");
        System.out.println();
    }

    /**
     * Creates an example instance.
     *
     * @return an example instance
     * @throws Exception if an error occurs
     */
    private static StartDomainExample createExample()
            throws Exception {
        String domainName = getParameter("Enter domain name: ");
        File configFile = getConfigFile();

        return new StartDomainExample(domainName, configFile);
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
     * @return user response
     * @throws Exception if an I/O error occurs
     */
    private static String getParameter(String prompt)
            throws Exception {
        System.out.print(prompt);
        return CONSOLE_READER.readLine();
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

    /**
     * Constructs example.
     *
     * @param domainName domain name
     * @param configFile config file
     */
    public StartDomainExample(String domainName, File configFile) {
        this.domainName = domainName;
        this.configFile = configFile;
    }

    /**
     * Starts domain.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            this.manager.startDomain(this.domainName);

            System.out.println("Domain started!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
				this.manager.disconnect();
			}
        }
    }

}
