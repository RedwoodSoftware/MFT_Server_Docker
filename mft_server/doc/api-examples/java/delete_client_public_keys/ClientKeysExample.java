import com.jscape.inet.mft.management.client.api.ManagerSubsystem;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClientKeysExample {

    private static final BufferedReader CONSOLE_READER = new BufferedReader(new InputStreamReader(System.in));

    private static final String DEFAULT_CLIENT_CONFIG_FILE = "client.cfg";

    private static final Logger logger = Logger.getLogger("org.bouncycastle.jsse.provider");

    private final File configFile;
    private ManagerSubsystem manager;

    public static void main(String[] arguments)
            throws Exception {
        suppressLogging();
        showExampleTitle();
        ClientKeysExample example = createExample();
        example.execute();
    }

    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

    private static void showExampleTitle() {
        System.out.println("This example demonstrates how to handle keys using the server API.");
        System.out.println();
    }

    private static ClientKeysExample createExample()
            throws Exception {
        File configFile = getConfigFile();

        return new ClientKeysExample(configFile);
    }

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

    private static String getParameter(String prompt)
            throws Exception {
        System.out.print(prompt);
        return CONSOLE_READER.readLine();
    }

    public ClientKeysExample(File configFile) {
        this.configFile = configFile;
    }

    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            //Delete global client keys
            this.manager.deleteClientPublicKey("id_global");

            //Delete domain specific client keys
            this.manager.deleteClientPublicKey("id_domain_level", "domain_name");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
                this.manager.disconnect();
            }
        }
    }
}
