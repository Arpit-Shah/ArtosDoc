ARTOS (Art of System Testing)
*****************************
ARTOS is developed by a team of experienced test engineers for test developers/engineers. It was designed and developed with the aim to provide a test framework which is easy to use, reliable and works out of the box. ARTOS is written in Java which makes it suitable for Windows, Linux, MAC or any other platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Most test frameworks only provide the test runner while the rest is left on engineers to develop, whereas ARTOS comes with many inbuilt and well tested utilities saving time for users to focus on what they do best!

ARTOS feature highlight
#######################

* Built-in and pre-configured log framework

   * Organized logging for ease of use
   * Text or HTML formatted logs 
   * Five log level support
   * Real-time log files in addition to general log file (for performance measurement)
   * Runtime log enable/disable
   * Tracking of generated log files
   * Separate log files per test suite during parallel testing

* Built-in report generation

   * Professional looking Extent report
   * Simple text or HTML formatted report
   * Separate test reports per test suite during parallel testing

* Test time measurement

	* Test-suite, test-case and test-units execution duration measurement with millisecond accuracy

* Test importance
	
	* Test importance is highlighted to focus on important test cases

* Easy debugging
   
   * GUI test selector for selective testing and avoids user error
   * FAIL stamp injection in the log file to pin point exact line of failure
   * Failure highlight at the end of test suite execution
   * Bug reference reporting against failed test case
   * Test time tracking with millisecond accuracy
   * BDD formatted test plan injection in the log file to avoid disconnect between test plan and test case

* TestCase development

   * Group based test case and test unit filtering
   * Exception checking
   * Known to fail test case support
   * Data Provider support
   * Parallel testing
   * Sequentialize test cases to maintain dependency and repeatability
   * Disable/Skip test cases
   * Global parameter support
   * Built in utilities for test development (Data Transformation, CountDownTimer, Live display, Guardian etc..)
   * Built in connectors (TCP, UDP etc..)

* Additional features

   * Stop on fail support
   * Properties based test framework configuration
   * Automated test script generation

* Listeners for future plug-in or application development. 

Framework Glossary
##################

.. csv-table:: 
   :header: **Keyword**, **Description**
   :widths: 17, 83
   :stub-columns: 0
   
   Test Suite  , "A collection of test cases that are designed specifically to test the system under test"
   Test Runner , "A class which is the entry point to a test application. It is responsible for running and tracking test cases from the start to end"
   Test Case   , "A class which contains set of instructions that will be performed on the system under test"
   Test Unit   , "A method within a test case that represents the smallest and independent executable unit"
   Test Script , "A set of instructions to guide the test runner on how to execute test cases. The test script is represented by xml script"
   Scan Scope  , "A section of the Java project which will be scanned during the search of test cases"
   Test Status , "The state of a test case at the time of execution (namely: PASS, FAIL, SKIP or KTF)"
   Unit Outcome, "The final outcome of the test unit (namely: PASS, FAIL, SKIP or KTF)"
   Test Outcome, "The final outcome of the test case (namely: PASS, FAIL, SKIP or KTF)"

..

Abbreviations
#############

KTF : Known To Fail


Annotations
###########

ARTOS makes use of Java annotations for most of its features. A list of supported annotations is provided below. Annotation in detail will be covered in later sections.

.. csv-table:: 
   :header: **Annotation**, **Applies To**, **Usage**
   :widths: 22, 15, 63
   :stub-columns: 0

   @TestCase         , Class         , "Annotation used to mark a class as a test case"
   @TestPlan         , Class         , "Annotation used to document a test plan and other test case related information"
   @Unit             , Method        , "Annotation used to mark a method inside a test case as a test unit"
   @BeforeTestSuite  , Method        , "Annotation used to mark a method that is invoked before test suite execution"
   @AfterTestSuite   , Method        , "Annotation used to mark a method that is invoked after test suite execution"
   @BeforeTest       , Method        , "Annotation used to mark a method that is invoked before each test case(s) execution from a test suite"
   @AfterTest        , Method        , "Annotation used to mark a method that is invoked after each test case(s) execution from a test suite"
   @BeforeTestUnit   , Method        , "Annotation used to mark a method that is invoked before test units execution"
   @AfterTestUnit    , Method        , "Annotation used to mark a method that is invoked after test units execution"
   @DataProvider     , Method        , "Annotation used to mark method(s) behaving as supplier of test data to the test case(s)"
   @ExpectedException, Method        , "Annotation used to specify list of exception type(s) and/or exception message. Attribute values are used to derive test outcome"
   @Group            , Class/Method  , "Annotation used to specify list of groups that a test case or a test unit belongs to" 
   @KnownToFail      , Class/Method  , "Annotation used to enforce known to fail check for annotated test case and test unit"

..

GUI test selector
#################

ARTOS provides built-in GUI test selector that is designed to help test developers run selective test cases during development and debugging. GUI test selector feature can be enabled or disabled by changing framework configuration. GUI test selector details will be covered in later sections.

Test logs
#########

 ARTOS log levels, log decorations, log format can be configured using framework configuration. FAIL stamp is injected in the log file when test status is updated to FAIL (by the test), so that user can pin point exact line (in the log file) where failure has occurred.

Test report
###########

ARTOS auto generates text and/or HTML based test report. This report only contains PASS/FAIL information so it can be shared with external parties keeping business critical information contained in log files.

ARTOS additionally generates professional looking Extent report if enabled.

