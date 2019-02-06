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