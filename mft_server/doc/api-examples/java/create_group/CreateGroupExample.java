import com.jscape.inet.mft.management.client.api.ManagerSubsystem;
import com.jscape.inet.vfs.AccessPermissions;
import com.jscape.inet.vfs.Group;
import com.jscape.inet.vfs.VirtualFileDescriptor;
import com.jscape.inet.vfs.VirtualLocalFileDescriptor;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This example demonstrates how to add a group using the server API.
 */
public class CreateGroupExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final String domainName;
    private final String groupName;
    private final String virtualPath;
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
        String domainName = getParameter("Enter domain name: ");
        String groupName = getParameter("Enter group name e.g. Accountants: ");
        String virtualPath = getParameter("Enter virtual path e.g. /group: ");
        String realPath = getParameter("Enter default group directory e.g. C:\\home: ");
        File configFile = getConfigFile();

        return new CreateGroupExample(domainName,
                                      groupName,
                                      virtualPath,
                                      realPath,
                                      configFile);
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
     * Constructs example.
     *
     * @param domainName domain name
     * @param groupName  group name
     * @param virtualPath group virtual path
     * @param realPath   user login directory
     * @param configFile config file
     */
    public CreateGroupExample(String domainName, String groupName, String virtualPath, String realPath, File configFile) {
        this.domainName = domainName;
        this.groupName = groupName;
        this.virtualPath = virtualPath.charAt(0) == '/' ? virtualPath : "/" + virtualPath;
        this.realPath = realPath;
        this.configFile = configFile;
    }

    /**
     * Creates group and adds to server.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            Group group = createGroup();
            this.manager.addGroup(this.domainName, group);

            System.out.println("Group created successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
				this.manager.disconnect();
			}
        }
    }

    /**
     * Creates a group.
     *
     * @return a group
     */
    private Group createGroup() {
        VirtualFileDescriptor path = createVirtualFileDescriptor();
        VirtualFileDescriptor[] descriptorList = new VirtualFileDescriptor[]{path};

        return new Group(this.groupName, descriptorList);
    }

    /**
     * Creates virtual file descriptor.
     *
     * @return the virtual file descriptor
     */
    private VirtualFileDescriptor createVirtualFileDescriptor() {
        return new VirtualLocalFileDescriptor(virtualPath, new AccessPermissions(), this.realPath, true);
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

}
