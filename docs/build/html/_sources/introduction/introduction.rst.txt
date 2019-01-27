ARTOS (Art of System Testing) 
*****************************
ARTOS was developed by a team of experienced test engineers for test developers/engineers. It was designed and developed with the aim to provide a test framework which is easy to use, reliable and works out of the box. ARTOS is written in Java which makes it suitable for Windows, Linux, MAC or any other platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Most test frameworks only provide the test runner while the rest is left on engineers to develop, whereas ARTOS comes with many inbuilt and well tested utilities saving time for users to focus on what they do best!

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
	@BeforeTestUnit, Method, Annotation used to mark a method that is invoked before test units [1]_ .
	@AfterTestUnit, Method, Annotation used to mark a method that is invoked after test units [2]_ .
	@DataProvider, Method, Annotated method(s) are marked as a supplier of data for the test case(s).
	@ExpectedException, Method, Annotation used to specify list of exceptions and/or exception message. Attribute values are used to derive test outcome
	@Group, Class & Method, Annotation used to specify list of groups that a test case or a test unit belongs to. 
	@KnownToFail, Class & Method, Annotation used to enforce known to fail check for annotated test case.

..

.. [1] @BeforeTestUnit

	Method marked with annotation ``@BeforeTestUnit`` is executed in different order depending on where it is implemented. All possible combinations are listed below:

	.. csv-table:: 
		:header: Location, Execution sequence
		:widths: 40, 70
		:stub-columns: 0

		**Inside a Runner**, Invoked before each test units **within a test suite**.
		**Inside a Test-Case**, Invoked before each test units **within a test case**.
		**Inside a Runner and a Test-Case**, Method implemented within the Runner class is invoked before each test units **within a test suite** and the method implemented in the test case will be invoked before each test units **within a test case**. Method implemented in the Runner class will execute before method implemented in the test case. 

	..

..

.. [2] @AfterTestUnit

	Method marked with annotation ``@AfterTestUnit`` is executed in different order depending on where it is implemented. All possible combinations are listed below:

	.. csv-table:: 
		:header: Location, Execution sequence
		:widths: 40, 70
		:stub-columns: 0

		**Inside a Runner**, Invoked after each test units **within a test suite**.
		**Inside a Test-Case**, Invoked after each test units **within a test case**.
		**Inside a Runner and a Test-Case**, Method implemented within the Runner class is invoked after each test units **within a test suite** and the method implemented in the test case will be invoked after each test units **within a test case**. Method implemented in the Runner class will execute after method implemented in the test case. 

	..

..

TestContext
###########

Test context is a container that holds test suite related information from start to end of execution. ``TestContext`` object is created per test suite. ``TestContext`` object is passed as an argument to all annotated methods so it remains available throughout test execution cycle. Test context maintains live information about test case. 