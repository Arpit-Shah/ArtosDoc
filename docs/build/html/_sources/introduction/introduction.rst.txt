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
	Test Status, A state of a test case at the line of execution
	Test Outcome, The final outcome of a test case 

..

Annotations
###########

ARTOS makes use of Java annotations for most of its features. A list of supported annotations is provided below. Annotation in detail will be covered in later sections.

.. csv-table:: 
	:header: Annotation, Applies To,Usage
	:widths: 30, 30, 40
	:stub-columns: 0

	@TestCase, Class, Annotates a class as a test case
	@TestPlan, Class, An annotation used to document a test case information and/or a test plan.
	@Unit, Method, Annotates a method as a test unit (Method must be implemented inside a test case)
	@BeforeTestSuite, Method, Annotated method is invoked before test suite (Method must be implemented inside a test runner of a test suite)
	@AfterTestSuite, Method, Annotated method is invoked after test suite (Method must be implemented inside a test runner of a test suite)
	@BeforeTest, Method, Annotated method is invoked before each test cases of a test suite (Method must be implemented inside a test runner of a test suite)
	@AfterTest, Method, Annotated method is invoked after each test cases of a test suite (Method must be implemented inside a test runner of a test suite)
	@BeforeTestUnit, Method, Annotated method is invoked before each test units of a test suite if **implemented inside a test runner** of a test suite. Annotated method is invoked before each test units within a particular test case if **implemented inside same test case**
	@AfterTestUnit, Method, Annotated method is invoked after each test units of a test suite if **implemented inside a test runner** of a test suite. Annotated method is invoked after each test units of a particular test case if **implemented inside same test case**
	@DataProvider, Method, Annotated method(s) are marked as a supplier of data for the test case(s).
	@ExpectedException, Class & Method, An annotation used to specify list of exceptions and/or exception message. Attribute values are used to derive test outcome
	@Group, Class & Method, An annotation used to specify list of group test case or test unit belongs to. 
	@KnownToFail, Class & Method, An annotation used to mark a test case or a test unit as known to fail. If marked test unit or a test case did not fail with outcome KTF then it will be marked as failure

..