.. _Log4j_Pattern: https://logging.apache.org/log4j/2.x/manual/layouts.html

Logging Framework
*****************

Logs and reports are heart of any test framework. ARTOS includes Log4j based pre-configured and ready to use log framework.

Log files
#########

ARTOS by default generates two log files and a summary report per test suite. Each test suite execution generates new log files so previously generated log files will not be deleted or overwritten. 

    * General logs := All test application logs will be recorded in a log file as shown on console output. 

        * By default general log lines do not include time-stamp or any other decoration, which makes it easy to read. 
        * Time-stamp and other relevant decoration can be enabled using ``framework_configuration.xml`` file when required. 

    * Real-time logs := Separate log file is generated to record sent and received events/data from classes that implements ``Connectable`` interface.

    .. image:: Realtime_log.png

    * Summary Report := Summary report log file generated to record PASS/FAIL summary of a test suite. 

        * Summary report may only contain test-case name, test-unit name, test-status and/or bug reference number, so it can be shared with management and/or external parties without disclosing too much details or business critical information.

    .. image:: Summary_Report.png

.. note:: 

    Test application and device under test may communicate using well defined protocols like Serial, RS485, TCP, UDP, TLS, USB, Protocol buffers etc.., Test application connector may queue incoming/outgoing events/data and application processes them one by one. Logging sent and received data live with time-stamp in separate log file (Realtime log file) keeps all the other noise away. Those logs can be later processed easily using Python script or similar. For all other debugging General logs can be used. 
..

Log File Path and Naming Convention
###################################

* Log files path := ``./reporting/subdirectory/``. Runner's package name is used as a sub-directory name to keep log files organized.
* General log filename := ``package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-all.log"``
* RealTime log filename := ``package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-realtime.log"``
* Summary report filename := ``package name + "_" + suitename (optional) + "_" + threadnumber + "_" +  timestamp + "-summary.log"``

>>> Example:
General log file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-all.log``
Real time log file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-realtime.log``
Summary report file : ``./reporting/com.test.feature1/com.test.feature1_suite1_0_1549353269885-summary.log``

Log Format
##########

* ARTOS supports text and HTML formatted logs.
* Text formatted log and report are enabled by default.
* Text and/or HTML logs can be enabled/disabled using ``framework_configuration.xml`` file. 

Log Pattern
###########

* General logs are not decorated by default to maintain simplicity.
* Log decoration can be enabled/disabled using ``framework_configuration.xml`` file.

    * Decoration disabled log pattern: ``"%msg%n%throwable"``
    * Decoration enabled log patter: ``"[%-5level][%d{yyyy-MM-dd_HH:mm:ss.SSS}][%t][%F][%M][%c{1}] - %msg%n%throwable"``
    * Refer: Log4j_Pattern_ for more information.

Log Rollover Policy
###################

    * Log rollover policy is triggered based on a file size of 20MB. 

Log Level
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
        
Runtime Log Enable/Disable
##########################

General log can be enabled/disabled at run time using following methods:

    * Disable log: ``context.getLogger().disableGeneralLog();``
    * Enable log: ``context.getLogger().enableGeneralLog();``

Log File Tracking
#################

All log files relevant to test suite are tracked and can be queried at runtime using following methods:

    * General log file list: ``context.getLogger().getCurrentGeneralLogFiles();``
    * Real-Time log file list: ``context.getLogger().getCurrentRealTimeLogFiles();``
    * Summary report file list: ``context.getLogger().getCurrentSummaryLogFiles();``

FAIL Stamp Injection
####################

**FAIL** Stamp is injected to log stream after test status is updated to FAIL. This allows user to know at which exact line the test unit failed during execution.

>>> Sample Stamp
**********************************
*********** FAIL HERE ************
**********************************

Parameterized logging
#####################

ARTOS supports parameterized logging. 

* Logging using string concatenation:

    ``context.getLogger().info("This is a test String" + "This is a test String 1");``
    ``context.getLogger().debug("This is a test String" + "This is a test String 2");``

* Logging using parameterized string:

    ``context.getLogger().info("This is a test String {} {}", "one", "two");``
    ``context.getLogger().debug("This is a test String {} {}", "one", "two");``

.. warning::

    Parameterized logging is less efficient compare to string concatenation, if test application does not use multiple log levels then it is recommended to avoid parameterized logging. Parameterized logging overall improves performance in case where test application utilities multiple log levels and user switches between log levels because system does not waste time in concatenating strings for logs which are disabled using log level configuration.

..