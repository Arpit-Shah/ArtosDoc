.. _Log4j_Pattern: https://logging.apache.org/log4j/2.x/manual/layouts.html

Logging Framework
*****************

* Purpose:

    * Logs and reports are heart of any test framework.
    * Artos log framework:

    	* Pre-configured and ready to be used.
        * Capable of producing text and/or HTML log files.
    	* Generates real-time logs which can be used for performance measurement.
    	* Generates summary report which can be used as customer facing reports. (Separate to Extent Report)
    	* Provides features which can be very useful in test development.

* Facilities:

    * Two log layouts are supported:

        * Text layout (Default enabled).
        * HTML layout (Default disabled).

    * Two log files are generated per test suite execution:

        * General log file: All logs (Same as console log).
        * Real Time log file: Send/receive message logs from connectable interfaces with time-stamp.

    * Report is generated per test suite:

        * Summary report: Summarized pass/fail summary with test name, execution time and bug reference number.

    * Log patterns (decoration):

        * Decoration enabled pattern: 

        ``"[%-5level][%d{yyyy-MM-dd_HH:mm:ss.SSS}][%t][%F][%M][%c{1}] - %msg%n%throwable"``

        * Decoration disabled pattern: 

        ``"%msg%n%throwable"``

        Refer: Log4j_Pattern_

    * Log level support:

        * Following log levels are supported:

        .. csv-table:: 
            :header: Level, Description
            :widths: 20, 70
            :stub-columns: 0
            
            DEBUG, Designates fine-grained informational events that are most useful to debug an application.
            ERROR, Designates error events that might still allow the application to continue running.
            FATAL, Designates severe error events that will presumably lead the application to abort.
            INFO, Designates informational messages that highlight the progress of the application at coarse level.
            OFF, The highest possible rank and is intended to turn off logging.
            TRACE, Designates finer-grained informational events than the DEBUG.
            WARN, Designates potentially harmful situations.

        ..        
            
    * Note: Log level can be configured using ``conf/framework_configuration.xml`` file.
        
    * Log can be enabled/disabled dynamically (Only applicable to general log)

        * Disable log dynamically: ``TestContext().getLogger().disableGeneralLog();``
        * Enable log dynamically: ``TestContext().getLogger().enableGeneralLog();``

    * Parallel test suite execution will generate separate log files per test suite.

        	* Log files will be labeled using thread number.

    * Log files are organized under test suite name for ease of use.

        * Log files are created under the following hierarchy. ``RootDir => SubDir => TestSuiteName => Log file``.

        >>> Example: ``./reporting/SN-123/com.test.testsuite1/..``

        * Root directory and sub directory location can be configured using ``conf/framework_configuration.xml`` file.

    * Log framework abstraction

        * Log framework is abstracted so that log framework can be changed in future without breaking existing test scripts.

    * Log file tracking

        * All log files are tracked during runtime. If user requires to retrieve current log files (inclusive of text/HTML) they can utilize this functionality.
        * This functionality will also be used to find current log files and attach to email client.

    * **FAIL** stamp injection

        * **FAIL** Stamp is injected to log stream straight after test status is updated to FAIL. This allows user to know at which exact line the test case failed during execution.

    * Log rollover policy

        * Current log rollover policy is triggered based on a file size of 20MB.
        * 20MB was chosen to meet emailing requirement. Trigger policy can be exposed to user in future.

    * Parameterized logging for efficiency

    	* Parameterized logging is less efficient compare to string concatenation but it is efficient in case of log level is reduced to **INFO** or **ERROR**, because system do not have to spend time concatenating string.

* Usage:

    * Enable/disable text/HTML log files:

    	* Can be configured using ``conf/framework_configuration.xml`` file.

    * Change log level and log directory:

    	* Can be configured using ``conf/framework_configuration.xml`` file.

    * logging simple string with level info or debug:

    	``TestContext().getLogger().info("This is a test String" + "This is a test String 2");``
    	``TestContext().getLogger().debug("This is a test String" + "This is a test String 2");``

    * logging parameterized string with level info or debug:

    	``TestContext().getLogger().info("This is a test String {} {}", "one", "two");``
    	``TestContext().getLogger().debug("This is a test String {} {}", "one", "two");``

        * Disable logging during execution time:

        ``TestContext().getLogger().disableGeneralLog();``

        * Enable logging during execution time:

        ``TestContext().getLogger().enableGeneralLog();``

Off-line Extent Report
**********************

* Purpose:

Professional looking Extent report which can be distributed among customer or external parties.

* Facilities:

    * If Extent configuration file is not present, then framework will generate default configuration file at location ``conf/extent_configuration.xml``.
    * Artos has inbuilt support for off-line Extent reporting.
    * If enabled, Artos will produce Extent report for every test suite execution.
    * Extent report includes test name, test writer's name and test case duration.
    * Every test status update and description/reason will be reported via Extent report.
    * Final test result with bug reference number will be reported via Extent report.

* Usage:

    * Extent reporting can be enabled/disabled via ``conf/framework_configuration.xml`` file.

Real Time Logging
*****************

* Purpose:

	* Performance testing requires real-time logs so time between messages can be measured accurately. Artos has inbuilt interface which can be used to provide real time logging.

* Facilities:

	* Artos has inbuilt hooks for real time logging. All inbuilt connectors support real-time logging.
	* User can write new connectors by implementing ``Connectable`` interface and use listener ``RealTimeLogEventListener`` to capture real-time log events.
	* Real time logs are printed with time stamp, user is not allowed to disable time-stamp.
	* If test suites are executed in parallel then separate real time log file will be produced per test suite.
	* Real time log file will roll over at 20MB of file size.
	* Real time logs cannot be disabled. If `RealTimeLogEventListener` is not provided then log file will remain empty.

* Usage:

	* Collect send receive events in real time with time stamp.

Stop on Fail
************

* Purpose:
	* Depending on the goal, some user may want to continue next test execution after a test case failure, in other case user may choose to stop after very first test case failure. Artos support both behaviors.

* Facilities:

	* By default, Artos is setup to stop on first failure. it can be configured to continue executing rest of the test cases.

* Usage:

	* Stop on Fail feature can be enabled/disabled via ``conf/framework_configuration.xml`` file.