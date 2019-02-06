.. _Log4j_Pattern: https://logging.apache.org/log4j/2.x/manual/layouts.html

Logging Framework
*****************

Logs and reports are heart of any test framework. ARTOS includes Log4j based pre-configured and ready to use log framework.

* ARTOS framework produces two log files when enabled.

  	* General log file (Same as console logs).
    * Real-time log file which contains sent/received message logs from ``Connectable`` interfaces with time-stamp. It is used for performance measurement and quick debugging.

* ARTOS framework produces text and/or HTML formatted report when enabled.

    * Summary report which contains PASS/FAIL summary and bug reference information.

* Parallel test suite execution will generate separate log files per test suite.

Log file-path and filename
##########################

* Log files are generated inside "./reporting/subdirectory" by default. Runners package name is used as subdirectory name to keep logs organized.
* General log filename : Runners package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-all.log".
* RealTime log filename : Runners package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-realtime.log".
* Summary report filename : * General log filename : Runners package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-summary.log".

>>> Example: Runner package name is ``com.test.feature1''
General log file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-all.log``
Real time log file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-realtime.log``
Summary report file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-summary.log``

Log file format
###############

* ARTOS supports text and HTML formatted logs.
* Text formatted log and report are enabled by default.
* Text and/or HTML logs can be enabled/disabled using ``framework_configuration.xml`` file. 

Log pattern
###########

* General logs are not decorated by default to maintain simplicity.
* Log decoration can be enabled/disabled using ``framework_configuration.xml`` file.

    * Decoration disabled log pattern: ``"%msg%n%throwable"``
    * Decoration enabled log patter: ``"[%-5level][%d{yyyy-MM-dd_HH:mm:ss.SSS}][%t][%F][%M][%c{1}] - %msg%n%throwable"``
    * Refer: Log4j_Pattern_ for more information.

Log rollover policy
###################

    * Log rollover policy is triggered based on a file size of 20MB. 

Log level
#########

Log level can be configured using ``conf/framework_configuration.xml`` file.

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
        
Log enable/disable at runtime
#############################

General log can be enabled/disabled dynamically at run time

    * Disable log: ``context.getLogger().disableGeneralLog();``
    * Enable log: ``context.getLogger().enableGeneralLog();``

Log file tracking
#################

All log files relevant to test suite are tracked and can be queried at runtime

    * General log file list: ``context.getLogger().getCurrentGeneralLogFiles();``
    * Real-Time log file list: ``context.getLogger().getCurrentRealTimeLogFiles();``
    * Summary report file list: ``context.getLogger().getCurrentSummaryLogFiles();``

Log FAIL stamp injection
########################

**FAIL** Stamp is injected to log stream after test status is updated to FAIL. This allows user to know at which exact line the test case failed during execution.

Parameterized logging
#####################

Parameterized logging is less efficient compare to string concatenation but it is efficient in case of log level is reduced to **INFO** or **ERROR**, because system do not have to spend time concatenating string. Parameterized logging is available if user may require.

* logging simple string with level info or debug:

    ``context.getLogger().info("This is a test String" + "This is a test String 1");``
    ``context.getLogger().debug("This is a test String" + "This is a test String 2");``

* logging parameterized string with level info or debug:

    ``context.getLogger().info("This is a test String {} {}", "one", "two");``
    ``context.getLogger().debug("This is a test String {} {}", "one", "two");``