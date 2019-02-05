ARTOS (Art of System Testing) 
*****************************
ARTOS is developed by a team of experienced test engineers for test developers/engineers. It was designed and developed with the aim to provide a test framework which is easy to use, reliable and works out of the box. ARTOS is written in Java which makes it suitable for Windows, Linux, MAC or any other platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Most test frameworks only provide the test runner while the rest is left on engineers to develop, whereas ARTOS comes with many inbuilt and well tested utilities saving time for users to focus on what they do best!

Framework Glossary
##################

.. csv-table:: 
	:header: Keyword, Description
	:widths: 30, 70
	:stub-columns: 0
	
	Test Suite, A collection of test cases that are designed specifically to test the system under test
	Test Runner, A class which is the entry point to a test application. It is responsible for running and tracking test cases from the start to end
	Test Case, A class which contains set of instructions that will be performed on the system under test
	Test Unit, A method within a test case that represents the smallest and independent executable unit
	Test Script, A set of instructions to guide the test runner on how to execute test cases. The test script is represented by xml script
	Scan Scope, A section of the Java project which will be scanned during the search of test cases
	Test Status, "A state of a test case at the line of execution (PASS, FAIL, SKIP or KTF)"
	Unit Outcome, "The final outcome of the test unit (PASS, FAIL, SKIP or KTF)"
	Test Outcome, "The final outcome of a test case (PASS, FAIL, SKIP or KTF)"

..

Annotations
###########

ARTOS makes use of Java annotations for most of its features. A list of supported annotations is provided below. Annotation in detail will be covered in later sections.

.. csv-table:: 
	:header: Annotation, Applies To, Usage
	:widths: 30, 30, 40
	:stub-columns: 0

	@TestCase, Class, Annotation used to mark a class as a test case
	@TestPlan, Class, Annotation used to document a test plan and other test case related information.
	@Unit, Method, Annotation used to mark a method inside a test case as a test unit.
	@BeforeTestSuite, Method, Annotation used to mark a method that is invoked before test suite
	@AfterTestSuite, Method, Annotation used to mark a method that is invoked after test suite
	@BeforeTest, Method, Annotation used to mark a method that is invoked before each test cases of a test suite
	@AfterTest, Method, Annotation used to mark a method that is invoked after each test cases of a test suite
	@BeforeTestUnit, Method, Annotation used to mark a method that is invoked before test units.
	@AfterTestUnit, Method, Annotation used to mark a method that is invoked after test units.
	@DataProvider, Method, Annotated method(s) are marked as a supplier of data for the test case(s).
	@ExpectedException, Method, Annotation used to specify list of exceptions and/or exception message. Attribute values are used to derive test outcome
	@Group, Class & Method, Annotation used to specify list of groups that a test case or a test unit belongs to. 
	@KnownToFail, Class & Method, Annotation used to enforce known to fail check for annotated test case.

..

Test Status
###########

ARTOS support four test status as shown below. Status in detail will be covered in later sections.

.. csv-table:: 
    :header: Status, Usage
    :widths: 15, 65
    :stub-columns: 0
    
    PASS, Test case/unit executed without any errors
    SKIP, Test case/unit execution is skipped
    KTF, Test case/unit is known to fail
    FAIL, Test case/unit failed

..

GUI test selector
#################

ARTOS provides inbuilt GUI test selector that is designed to help test developers run selective test cases during development and debugging. GUI test selector feature can be enabled or disabled by changing framework configuration. GUI test selector details will be covered in later sections.

Test logs and reports
#####################

ARTOS provides inbuilt log utilities based on log4j. ARTOS logger is available to use out of the box. ARTOS log level, log decoration, log format can be configured using framework configuration. 

ARTOS additionally supports live log file which logs sent/received events from inbuilt connectors along with time stamp. Live log file provides following benifits:

* It can be used to measure system performance by measuring time between two events.
* Having this file with all needed information allows user to keep standard log file clean from time stamp, thread name, calling method name etc.. which makes standard log more readable
* Log parsing is easy with fixed format live log file which eventually makes debugging easy.  

ARTOS auto generates text and/or HTML based test report. This report only contains PASS/FAIL information so it can be shared with external parties keeping business critical information contained in log files. ARTOS additionally generates professional looking Extent report if enabled.