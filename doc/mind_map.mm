<map version="freeplane 1.9.13">
<!--To view this file, download free mind mapping software Freeplane from https://www.freeplane.org -->
<node TEXT="CAN_zephyr_rtos" FOLDED="false" ID="ID_696401721" CREATED="1610381621824" MODIFIED="1728047076081" LINK="https://github.com/zephyrproject-rtos/zephyr/tree/main/samples/drivers/can/counter" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false" associatedTemplateLocation="template:/standard-1.6.mm"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ID="ID_271890427" ICON_SIZE="12 pt" COLOR="#000000" STYLE="fork">
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" DASH="" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_271890427" STARTARROW="NONE" ENDARROW="DEFAULT"/>
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
<richcontent CONTENT-TYPE="plain/auto" TYPE="DETAILS"/>
<richcontent TYPE="NOTE" CONTENT-TYPE="plain/auto"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.selection" BACKGROUND_COLOR="#afd3f7" BORDER_COLOR_LIKE_EDGE="false" BORDER_COLOR="#afd3f7"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important" ID="ID_67550811">
<icon BUILTIN="yes"/>
<arrowlink COLOR="#003399" TRANSPARENCY="255" DESTINATION="ID_67550811"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10 pt" SHAPE_VERTICAL_MARGIN="10 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="3" RULE="ON_BRANCH_CREATION"/>
<node TEXT="prjconf" POSITION="right" ID="ID_1923972669" CREATED="1728047100510" MODIFIED="1728047103679">
<edge COLOR="#ff0000"/>
<node TEXT="shell" FOLDED="true" ID="ID_1997350979" CREATED="1728047103945" MODIFIED="1728047126926" LINK="https://docs.zephyrproject.org/latest/services/shell/index.html">
<node TEXT="CONFIG_SHELL=y&#xa;CONFIG_CAN_SHELL=y&#xa;CONFIG_DEVICE_SHELL=y" ID="ID_1514966243" CREATED="1728047172751" MODIFIED="1728047227981"/>
<node TEXT="Not understood fully how it works" ID="ID_1880276496" CREATED="1728047236192" MODIFIED="1728047247621"/>
</node>
<node TEXT="Asynchronous operation" FOLDED="true" ID="ID_1364242728" CREATED="1728047274913" MODIFIED="1728047319702" LINK="https://docs.zephyrproject.org/latest/services/notify.html">
<node TEXT="CONFIG_POLL=y" ID="ID_906822844" CREATED="1728047284316" MODIFIED="1728047286157"/>
<node TEXT="Not understood fully how it works" ID="ID_598257112" CREATED="1728047287615" MODIFIED="1728047298030"/>
</node>
<node TEXT="statistic management" FOLDED="true" ID="ID_1015483214" CREATED="1728047740361" MODIFIED="1728047752812" LINK="https://docs.zephyrproject.org/latest/services/device_mgmt/smp_groups/smp_group_2.html">
<node TEXT="CONFIG_STATS=y&#xa;CONFIG_STATS_NAMES=y&#xa;CONFIG_STATS_SHELL=y&#xa;CONFIG_CAN_STATS=y" ID="ID_315348359" CREATED="1728047799257" MODIFIED="1728047800800"/>
<node TEXT="Not fully understood how it works" ID="ID_267718189" CREATED="1728047801066" MODIFIED="1728047810108"/>
</node>
<node TEXT="CAN" FOLDED="true" ID="ID_438272590" CREATED="1728050342319" MODIFIED="1728050345096">
<node TEXT="# CONFIG_CAN_INIT_PRIORITY=80&#xa;# CONFIG_CAN_MAX_FILTER=5" ID="ID_815548739" CREATED="1728050345376" MODIFIED="1728050361316"/>
<node TEXT="For a reason I ignore, on platformIO this two config line cant&apos;t be set and create kconfig errors. But there by default to these values so I commented it out." ID="ID_766592059" CREATED="1728050376638" MODIFIED="1728050687573"/>
</node>
</node>
<node TEXT="code" POSITION="left" ID="ID_453066143" CREATED="1728047945498" MODIFIED="1728047947167">
<edge COLOR="#00ff00"/>
<node TEXT="Include" FOLDED="true" ID="ID_1801182319" CREATED="1728047947801" MODIFIED="1728051691753">
<node TEXT="byteorder" FOLDED="true" ID="ID_529131767" CREATED="1728048564608" MODIFIED="1728048569239">
<node TEXT="i#include &lt;zephyr/sys/byteorder.h&gt;" ID="ID_740194269" CREATED="1728048569465" MODIFIED="1728048571970"/>
<node TEXT="Allow to change byte order, with different endinaness" ID="ID_1336818861" CREATED="1728048574744" MODIFIED="1728048590160"/>
</node>
<node TEXT="device driver" FOLDED="true" ID="ID_1682004364" CREATED="1728048643761" MODIFIED="1728051691752">
<node TEXT="#include &lt;zephyr/device.h&gt;" ID="ID_318901282" CREATED="1728048648523" MODIFIED="1728048659241"/>
<node TEXT="manipuler les driver en fonction du device tree" ID="ID_1755658523" CREATED="1728048660426" MODIFIED="1728048713801" LINK="https://docs.zephyrproject.org/latest/kernel/drivers/index.html"/>
</node>
</node>
<node TEXT="intialization" ID="ID_36330709" CREATED="1728051700048" MODIFIED="1728051712156">
<node TEXT="struct" FOLDED="true" ID="ID_1089989528" CREATED="1728051712728" MODIFIED="1728052461593">
<node TEXT="const struct device *const can_dev" FOLDED="true" ID="ID_941299193" CREATED="1728051717868" MODIFIED="1728052456218" LINK="https://docs.zephyrproject.org/latest/kernel/drivers/index.html">
<node TEXT="pointteur constant vers une structuture constante qui s&apos;apppelle device." ID="ID_1866319410" CREATED="1728051738729" MODIFIED="1728051777074"/>
<node TEXT="Cette structure peut contenir des informations sur le device" ID="ID_1959394358" CREATED="1728051777772" MODIFIED="1728051835291"/>
</node>
<node TEXT="struct gpio_dt_spec led = GPIO_DT_SPEC_GET_OR(DT_ALIAS(led0), gpios, {0});" FOLDED="true" ID="ID_1429454147" CREATED="1728052269268" MODIFIED="1728052970762">
<node TEXT="GPIO_DT_SPEC_OR permet de récupérer une des propriétés des gpios. Par exemples si plusieurs GPIO peuvent allumer la led, avec {0} on récupère juste la première." ID="ID_1169243358" CREATED="1728052278366" MODIFIED="1728052372019" LINK="https://docs.zephyrproject.org/apidoc/latest/group__gpio__interface.html#ga26b2205aa82819df1d80a22761352e71"/>
<node TEXT="gpio_dt_spec contientune structure contenant les infos d&apos;un gpio récupéré depuis le device tree." ID="ID_208373270" CREATED="1728052412465" MODIFIED="1728052970759" LINK="https://docs.zephyrproject.org/apidoc/latest/structgpio__dt__spec.html"/>
</node>
<node TEXT="struct k_work_poll change_led_work;&#xa;struct k_work state_schange_work;" FOLDED="true" ID="ID_663743452" CREATED="1728052978010" MODIFIED="1728052999531" LINK="https://docs.zephyrproject.org/latest/kernel/services/threads/workqueue.html">
<node TEXT="k_work is a structure in Zephyr RTOS used to handle deferred or asynchronous tasks. It allows you to schedule functions that will be executed later in a background context (work thread)." ID="ID_46499405" CREATED="1728053001885" MODIFIED="1728053035427"/>
<node TEXT="k_work_poll is an extension of k_work that adds the ability to wait for an event before executing the task. It is used when you want a task to run only after a specific condition or event occurs, such as a message being available in a queue." ID="ID_1383563444" CREATED="1728053076418" MODIFIED="1728053077688"/>
</node>
<node TEXT="static struct k_poll_event change_led_events[1] =&#xa;{&#xa;    K_POLL_EVENT_STATIC_INITIALIZER(K_POLL_TYPE_MSGQ_DATA_AVAILABLE,&#xa;                                    K_POLL_MODE_NOTIFY_ONLY,&#xa;                                    &amp;change_led_msgq, 0)&#xa;};" FOLDED="true" ID="ID_1553666605" CREATED="1728055120419" MODIFIED="1728055151978" LINK="https://docs.zephyrproject.org/latest/kernel/services/polling.html">
<node TEXT="The k_poll_event structure is part of Zephyr&apos;s polling mechanism that allows threads to wait for various events, such as data becoming available in a message queue, an interrupt, or a timeout. It represents an event that can be polled (waited on). It holds information about what kind of event the thread is waiting for." ID="ID_721673127" CREATED="1728055196006" MODIFIED="1728055258437"/>
<node TEXT=" K_POLL_EVENT_STATIC_INITIALIZER&#xa;&#xa;This is a macro that initializes the k_poll_event structure. It sets the type of event and the conditions that should be met for the event to be triggered." FOLDED="true" ID="ID_541592090" CREATED="1728055331786" MODIFIED="1728055333303">
<node TEXT="K_POLL_TYPE_MSGQ_DATA_AVAILABLE: This defines the type of event. In this case, it tells the system that the event will occur when data becomes available in a message queue. So, we are waiting for a message to be added to the change_led_msgq.&#xa;&#xa;K_POLL_MODE_NOTIFY_ONLY: This defines the mode of polling. K_POLL_MODE_NOTIFY_ONLY means the thread will only be notified when the event happens. It does not consume or remove the data from the queue; it just signals the presence of data.&#xa;&#xa;&amp;change_led_msgq: This is a pointer to the message queue (change_led_msgq) that will be monitored for data availability. The event will trigger when a message is added to this queue.&#xa;&#xa;0: This is typically used for extra flags or parameters. In this case, it&apos;s set to 0, meaning no extra flags are used." ID="ID_1756898669" CREATED="1728055390833" MODIFIED="1728055392473"/>
</node>
</node>
<node TEXT="enum can_state current_state;&#xa;struct can_bus_err_cnt current_err_cnt;" FOLDED="true" ID="ID_1387940310" CREATED="1728053660407" MODIFIED="1728053664345">
<node TEXT="can_state is an enum storing the different state of the can" ID="ID_1380618861" CREATED="1728053666614" MODIFIED="1728053727350" LINK="https://docs.zephyrproject.org/apidoc/latest/group__can__interface.html#gac7ec472c26c564dd7067c49f67c8d2f7"/>
<node TEXT="can_bus_err_cnt count the number of error" ID="ID_513802953" CREATED="1728053749599" MODIFIED="1728053810000" LINK="https://docs.zephyrproject.org/apidoc/latest/structcan__bus__err__cnt.html"/>
</node>
</node>
<node TEXT="can message queu" FOLDED="true" ID="ID_307451765" CREATED="1728053987308" MODIFIED="1728054004453">
<node TEXT="CAN_MSGQ_DEFINE(change_led_msgq, 2);&#xa;CAN_MSGQ_DEFINE(counter_msgq, 2);" FOLDED="true" ID="ID_1076568249" CREATED="1728054005331" MODIFIED="1728054006972">
<node TEXT="This macro defines a message queue (msgq) that will hold CAN messages (struct can_frame). A message queue is a data structure that allows safe communication between threads by queuing messages that can be retrieved by other threads." ID="ID_48008086" CREATED="1728054121186" MODIFIED="1728054122894"/>
<node TEXT="Here the maximum number of CAN messages that the queue can hold at any given time. In both cases, the size is set to 2, meaning each queue can hold up to 2 messages before it becomes full." ID="ID_1570029142" CREATED="1728054188746" MODIFIED="1728054200044"/>
</node>
</node>
<node TEXT="functions" ID="ID_676696547" CREATED="1728056056351" MODIFIED="1728056058760">
<node TEXT="void tx_irq_callback(const struct device* dev, int error, void *arg)" FOLDED="true" ID="ID_716175326" CREATED="1728056059304" MODIFIED="1728056064675">
<node TEXT="The argument of this function are probably fixed for ISR declaration." ID="ID_1678705035" CREATED="1728056071706" MODIFIED="1728056107519"/>
<node TEXT="This callback is called if a message was send, or there was an error.&#xa;- error : indicate the error faced&#xa;- arg : a void pointer, containing the string describing the can sender" ID="ID_1202714548" CREATED="1728056111777" MODIFIED="1728056204157" LINK="https://docs.zephyrproject.org/2.7.5/reference/networking/can_api.html#sending"/>
</node>
<node TEXT="void rx_thread(void* arg1, void* arg2, void* arg3)" ID="ID_1434247048" CREATED="1728057237693" MODIFIED="1728057239090">
<node TEXT="    const struct can_filter filter = {&#xa;        .flags = CAN_FILTER_IDE,&#xa;        .id = COUNTER_MSG_ID,&#xa;        .mask = CAN_EXT_ID_MASK&#xa;    };" FOLDED="true" ID="ID_1980394446" CREATED="1728057239579" MODIFIED="1728057449082">
<node TEXT="This code defines a CAN filter in Zephyr RTOS, which is used to control which CAN messages are accepted or ignored based on their ID. CAN filters are essential for optimizing CAN communication, as they allow the system to listen only for messages of interest, reducing unnecessary processing of irrelevant messages." ID="ID_229577010" CREATED="1728057288987" MODIFIED="1728057321046" LINK="https://docs.zephyrproject.org/apidoc/latest/structcan__filter.html"/>
<node TEXT="flags: This field sets specific options for the filter. In this case:&#xa;&#xa;    CAN_FILTER_IDE: This flag indicates that the filter is for an extended CAN identifier (IDE stands for Identifier Extension). CAN frames can have either a standard (11-bit) or extended (29-bit) identifier, and this flag signals that extended IDs should be used in the filter.&#xa;&#xa;id: This field specifies the identifier that the filter will match against. In this case, it is set to COUNTER_MSG_ID, which is a constant representing the ID of the CAN message the system is interested in.&#xa;&#xa;    If a CAN message with this ID (COUNTER_MSG_ID) is received, the message will be accepted and processed by the system.&#xa;&#xa;mask: This field is a bitmask that is applied to the incoming message ID to determine which bits should be compared.&#xa;&#xa;    CAN_EXT_ID_MASK: This mask is used for extended CAN IDs. It defines which bits of the incoming message ID should be checked against the filter&apos;s id.&#xa;    A full mask (such as CAN_EXT_ID_MASK) typically means that all bits of the message ID must match the id for the message to be accepted." ID="ID_1681254923" CREATED="1728057367733" MODIFIED="1728057449081"/>
</node>
<node TEXT="struct can_frame frame;" FOLDED="true" ID="ID_1570853756" CREATED="1728057673264" MODIFIED="1728057746765" LINK="https://docs.zephyrproject.org/apidoc/latest/structcan__frame.html">
<node TEXT="In the CAN protocol, a frame is a data packet sent over the CAN bus. Each frame contains several fields, such as the message identifier (ID), data length, data payload, and some control flags. This structure models that frame in software, allowing the system to send and receive CAN messages." ID="ID_332811288" CREATED="1728057720537" MODIFIED="1728057722460"/>
</node>
<node TEXT="    filter_id = can_add_rx_filter_msgq(can_dev, &amp;counter_msgq, &amp;filter);" FOLDED="true" ID="ID_100915993" CREATED="1728058021561" MODIFIED="1728058022871">
<node TEXT="can_add_rx_filter is used to set up a filter that allows the system to receive specific CAN messages and direct them to a message queue (counter_msgq) in Zephyr RTOS. It tells the CAN device to listen for messages matching certain criteria (defined by filter) and place those messages into the counter_msgq message queue when they arrive." ID="ID_1891478633" CREATED="1728058026732" MODIFIED="1728058058817"/>
<node TEXT="The result of this function (filter_id) is the ID of the newly added filter.&#xa;If the filter was successfully added, the filter ID is returned. If something went wrong (e.g., no filters are available), an error code will be returned instead." ID="ID_1051961805" CREATED="1728058098693" MODIFIED="1728058100101"/>
</node>
<node TEXT="        k_msgq_get(&amp;counter_msgq, &amp;frame, K_FOREVER);" FOLDED="true" ID="ID_1157679518" CREATED="1728058721822" MODIFIED="1728058844870" LINK="https://docs.zephyrproject.org/apidoc/latest/group__msgq__apis.html#gae67f2ced2df1f9c290ae15dab9097cb7">
<node TEXT="retrieves a message from the message queue counter_msgq and stores it in the frame variable. It is part of Zephyr&apos;s message queue API, and this specific function call blocks (waits) until a message becomes available in the queue." ID="ID_1839404645" CREATED="1728058764934" MODIFIED="1728058875829"/>
</node>
<node TEXT="if(IS_ENABLED(CONFIG_CAN_ACCEPT_RTR) &amp;&amp; (frame.flags &amp; CAN_FRAME_RTR) != 0u)" ID="ID_1685684711" CREATED="1728060302681" MODIFIED="1728060305978">
<node TEXT="CONFIG_CAN_ACCEPT_RTR: This configuration option typically indicates whether the CAN controller is configured to accept Remote Transmission Requests (RTR). RTR messages are special types of CAN messages used to request data from another node on the CAN network without sending data back." ID="ID_1363494932" CREATED="1728060307509" MODIFIED="1728060410511"/>
<node TEXT="The entire if-statement checks two things:&#xa;&#xa;    - If the CAN controller is configured to accept Remote Transmission Requests (RTR) (using IS_ENABLED(CONFIG_CAN_ACCEPT_RTR)).&#xa;    - If the received frame has the RTR flag set (indicating that it is an RTR message).&#xa;&#xa;If both conditions are true, the code skips the rest of the processing for this CAN frame and continues to the next iteration of the loop." ID="ID_1700882175" CREATED="1728060459557" MODIFIED="1728060480057"/>
</node>
</node>
</node>
</node>
</node>
</node>
</map>
