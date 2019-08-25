Artos feature highlight
#######################

* Built-in and pre-configured log framework

	* Enable/Disable text and/or HTML formatted logs.
	* Enable/Disable logging at runtime.
	* Enable/Disable time-stamp and thread information.
	* Multiple log levels.

		.. image:: LogLevel.png

	* Real-time log files in addition to a general log file (for performance measurement).

		.. image:: RealTimeLogs.png
   
	* Separate log files per test suite during parallel testing.
	* Inbuilt log file roll over.
	* Log file tracking so user can parse, process or email log files at run time.


* Built-in report generation

	* Professional looking Extent report.

		.. image:: ExtentReportGraph.png

	* Attach snapshot to the Extent report.

		.. image:: Extent_Image_Attachment.png

	* Text and/or HTML formatted summary report.
	* JUnit xml report.
	* Separate test reports per test suite during parallel testing.

* Test duration

	* Test-suite, test-case and test-units execution duration measurement with millisecond accuracy

* Importance indicator
    
    * Assign importance to test case/units which is visible in summary report.

    	.. image:: ImportanceIndiactor.png

* GUI test selector
	
	* Execute selective test cases or all without modifying code/script and avoids typing error.
	* Run same test multiple time using loop count.
	* Visible test sequence number.
	* Highlights previously failed test for quick re-run.
	* Enable/Disable GUI based on requirement.

		.. image:: GUI_Test_Selector.png

* Failure indicator
	
	* Print failed test case tree at the end of console log.
	* Fail stamp injection in the log file to pinpoint the exact line of failure.
	* Highlight failed test from previous run in GUI test selector.
	* Bug/JIRA reference will be printed in summary for quick debugging.

* Known to fail

	* Segregate known to fail test cases from new failures
	* Warn user and trigger force failure in-case known to fail test case passes.

* Easy debugging
   
	* Add bug/JIRA reference to test case.
	* Add test description and BDD/Gherkin test plan within test case to avoid disconnect between test plan and test case.
	* Test case/unit writer/reviewers names can be added to test meta-data.
	* BDD test plan injection in the log file to avoid switch between test script and log files during debugging.
	* Real time log and general log are recorded in their own log files for easy debugging.
	* Automated fail test script generation for quick re-run.
	* Prints system info at the start of test execution for easy debugging.
	* Warns user with user friendly information printed on the console.

* TestCase development

	* Auto-generated test templates to speed up development
	* Group based test case and test unit filtering
	* Exception checking
	* Known to fail test case support
	* Data Provider support
	* Sequentialize test cases to maintain dependency and repeatability
	* Disable/Skip test cases
	* Global parameter support
	* Built-in utilities for test development (Data Transformation, CountDownTimer, Live display, Guardian, etc..)
	* Built-in connectors (TCP, UDP, etc..)
	* Global and local before-after method support.

* Stop on fail

	* Enable **Stop on Fail** to stop test execution after first failure.
	* Drop execution of remaining test case/unit if critical test case fails by enabling drop flag for given test case/unit.

* Parallel testing

	* Run test suites in parallel using test script.
	* Separate logs per test suite execution.
	* Separate extent reports per test suite execution.
	* Separate global variables and context per suite to avoid interference.
	* Execute same/different test cases per test suite.
	* Test multiple product/hardware/software at the same time using parallel testing.

* Cucumber BDD script (Behavior driven development)
   
	* Accepts Cucumber generated feature file for BDD testing
	* Auto generated BDD test templates to speed up development
	* BDD skeleton generation in case of missing methods

* Deployment

	* Support multiple framework configuration profiles for different environment. 
	* Execute test cases with pre-defined test script.
	* Disable GUI test selector for production environment. 
	* Automated test script generation.
	* Automated test script generation for failed test cases.
	* Log file tracking in-case log files are required to be emailed.
	* Dynamically enable/disable log to avoid bulk printing.
	* Execute as unit tests or functional test via JAR.

* Listeners

	* Listeners are supported for future plug-in or application development.