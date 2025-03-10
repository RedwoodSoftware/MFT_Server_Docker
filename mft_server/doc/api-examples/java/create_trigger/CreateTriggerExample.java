import com.jscape.inet.mft.management.client.api.ManagerSubsystem;
import com.jscape.inet.mft.transport.events.FileUploadEvent;
import com.jscape.inet.mft.workflow.ActionContext;
import com.jscape.inet.mft.workflow.Trigger;
import com.jscape.inet.mft.workflow.actions.SystemOutAction;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * This example demonstrates how to create a trigger based on File Upload event using the server API.
 */
public class CreateTriggerExample {

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
     * @throws Exception if an error occurs
     */
    private static CreateTriggerExample createExample()
            throws Exception {
        String domainName = getParameter("Enter domain name: ");
        File configFile = getConfigFile();

        return new CreateTriggerExample(domainName, configFile);
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
     * @param configFile config file
     */
    public CreateTriggerExample(String domainName, File configFile) {
        this.domainName = domainName;
        this.configFile = configFile;
    }

    /**
     * Creates domain and adds to server.
     */
    public void execute() {
        try {
            this.manager = new ManagerSubsystem(this.configFile);

            this.manager.connect();

            Trigger trigger = createTrigger();
            this.manager.createTrigger(this.domainName, trigger);

            System.out.println("Event service updated successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (this.manager != null) {
				this.manager.disconnect();
			}
        }
    }

    /**
     * Creates a trigger.
     *
     * @return a new trigger
     */
    private Trigger createTrigger() {
        Trigger trigger = new Trigger();

        trigger.setName("Test trigger");
        trigger.setDescription("A trigger example.");
        trigger.setEventClass(FileUploadEvent.class.getName());

        trigger.setExpressionString("Success = TRUE AND Name = \"test.txt\"");

        ActionContext actionContext = createActionContext();
        trigger.setContexts(new ActionContext[] {actionContext});

        return trigger;
    }

    /**
     * Creates an action context for SystemOut Action.
     *
     * @return an action context
     */
    private ActionContext createActionContext() {
        ActionContext context = new ActionContext();

        context.setActionClass(SystemOutAction.class);
        context.setParameter("Message", "File %Name% is successfully uploaded.");

        return context;
    }

    /**
     * Suppress the warning and info messages from BC
     */
    private static void suppressLogging() {
        logger.setLevel(Level.SEVERE);
    }

}
