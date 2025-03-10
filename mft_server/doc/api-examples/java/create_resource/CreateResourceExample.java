import com.jscape.inet.mft.management.client.api.ManagerSubsystem;
import com.jscape.inet.mft.resources.FtpResourceDescriptor;
import com.jscape.inet.mft.resources.RemoteResourceDescriptor;
import com.jscape.util.resources.ResourceDescriptor;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * This example demonstrates how to create a FTP reverse proxy using the server API.
 */
public class CreateResourceExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final String domainName;
    private final String resourceName;
    private final String hostname;
    private final int port;
    private final String connectionType;
    private final String userName;
    private final String password;
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
     *
     * @throws Exception if an error occurs
     */
    private static CreateResourceExample createExample()
            throws Exception {
        String domainName = getParameter("Enter domain name: ");
        String resourceName = getParameter("Enter resource name: ");        
        String hostname = getParameter("Enter resource hostname: ");
        int port = Integer.parseInt(getParameter("Enter resource port: "));
        String connectionType = "";
        while(!connectionType.equals(FtpResourceDescriptor.REGULAR)        		
        		&& !connectionType.equals(FtpResourceDescriptor.EXPLICIT_SSL)
        		&& !connectionType.equals(FtpResourceDescriptor.IMPLICIT_SSL)) {
        	connectionType = getParameter("Enter resource type (regular, explicit SSL, implicit SSL): ");        	
        }
        String userName = getParameter("Enter resource username: ");
        String password = getParameter("Enter resource password: ");
        File configFile = getConfigFile();

        return new CreateResourceExample(domainName,
                                        resourceName,
                                        hostname,
                                        port,
                                        connectionType,
                                        userName,                                        
                                        password,
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
     * @param domainName domain name
     * @param resourceName resource name
     * @param hostname resource hostname
     * @param port resource port
     * @param connectionType resource connection type
     * @param userName resource username/login
     * @param password password
     * @param configFile config file
     */
    public CreateResourceExample(String domainName, String resourceName, String hostname, int port, String connectionType, String userName, String password, File configFile) {
        this.domainName = domainName;
        this.resourceName = resourceName;
        this.hostname = hostname;
        this.port = port;
        this.connectionType = connectionType;
        this.userName = userName;
        this.password = password;
        this.configFile = configFile;
    }

    /**
     * Creates resource and adds to server.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            RemoteResourceDescriptor reverseProxy = createReverseProxy();
            this.manager.createReverseProxy(this.domainName, reverseProxy);

            System.out.println("Network storage created successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
				this.manager.disconnect();
			}
        }
    }

    /**
     * Creates a resource.
     *
     * @return a resource
     */
    private RemoteResourceDescriptor createReverseProxy() {
    	FtpResourceDescriptor descriptor = new FtpResourceDescriptor();
    	descriptor.setName(this.resourceName);
    	descriptor.setHost(this.hostname);
    	descriptor.setPort(this.port);
    	descriptor.setConnectionType(this.connectionType);
    	descriptor.setUsername(this.userName);
    	descriptor.setPassword(this.password);
    	descriptor.setPassive(true);
    	return descriptor;
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }
}
