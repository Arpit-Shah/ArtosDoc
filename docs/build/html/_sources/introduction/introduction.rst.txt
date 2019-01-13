ARTOS (Art of System Testing) 
*****************************
ARTOS was developed by bunch of experienced test engineers for test developers/engineers. It was designed and developed with the aim to provide a test framework which is easy to use, reliable and works out of the box. ARTOS is written in Java which makes it suitable for Windows, Linux, MAC or any other platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Most test frameworks only provide test runner/executor and rest is left on engineers to develop, Whereas Artos comes with many inbuilt and well tested utilities saving time for users to focus on what they do best!

Framework Glossary
##################

.. csv-table:: 
	:header: Keyword, Description
	:widths: 30, 70
	:stub-columns: 0
	
	Test Runner, A class which is the entry point for test application. It is responsible for executing and tracking test cases from start to end. 
	Test Suite, Collection of test cases that are intended to be used to test a software program. Represented by Java project or package.
	Test Case, Set of instructions that will be performed on the system under test. Test case is a Java class annotated by @TestCase annotation.
	Test Unit, Smallest executable unit within a test case which can be exercised independently. Test unit is a Java method annotated by @Unit annotation.
	Test Script, Set of instructions that will guide test runner on how to execute test cases. Test script is represented by xml script which contains execution instruction for one or more test suites.
	Scan Scope, Section of the Java project which will be scanned during the search of test cases.

..

Project Hierarchy
#################

* Test project have one or more test suite(s).
* Each test suite have one or more test case(s).
* Each test case have one or more test unit(s).

>>> Hierarchy
	TestSuite => TestCase => TestUnit

Annotations
###########

ARTOS makes use of Java annotations for most of the features. Supported annotations list is provided below. Annotations will be covered in detail in later sections.

.. csv-table:: 
	:header: Annotation, Applies To,Usage
	:widths: 30, 30, 40
	:stub-columns: 0

	@TestCase, Class, Annotated class is marked as a test case
	@TestPlan, Class, TestPlan/Information of a test case which will be printed in the log file for user reference.
	@Unit, Method, Annotated method is marked as a test unit
	@BeforeTestSuite, Method, Annotated method will be run once prior to any test case execution in given test suite
	@AfterTestSuite, Method, Annotated method will be run once post execution of all test cases within given test suite
	@BeforeTest, Method, Annotated method will be run once before each test case
	@AfterTest, Method, Annotated method will be run once after each test case
	@BeforeTestUnit, Method, Annotated method will be run once prior each test unit 
	@AfterTestUnit, Method, Annotated method will be run once after each test unit 
	@DataProvider, Method, Annotated method is marked as supplier of data for test case. The annotated method must return Object[][].
	@ExpectedException, Class & Method, Annotated class/method outcome is decided based on attributes specified in the annotation.
	@Group, Class & Method, List of groups class/method belongs to.
	@KnownToFail, Class & Method, Annotated class/method outcome is decided based on attributes specified in the annotation.

..

ARTOS was designed to be flexible so many framework features can be enabled or disabled using ARTOS' configuration file ``framework_configuration.xml``.

Test Runner
###########

* Test runner is the class which is the entry point for test application.
* Test runner must be public and contains main() method. 
* Test runner main method must invoke Runner class object as shown below.

Example test runner:

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	public class ArtosMain {
		public static void main(String[] args) throws Exception {
			Runner runner = new Runner(ArtosMain.class);
			runner.run(args, null, 1);
		}
	} 

..

Test Suite
##########

* Belongs to Java project.
* Test suite is a collection of test cases which belong to one or more packages.

Test Case
#########

* Belongs to test suite.
* Test case must be public and annotated with ``@TestCase`` annotation.
* Test case must implement ``TestExecutable`` interface.
* Test case contains one or more test units.

Example test case:

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@TestCase()
	public class TestCase_1 implements TestExecutable {
		@Unit
		public void unit_test(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			context.getLogger().debug("Hello World");
			// --------------------------------------------------------------------------------------------
		}
	}

..

Test Unit
#########

* Belongs to test case.
* Test unit must be annotated with ``@Unit`` annotation.
* Test unit must follow method signature ``public void methodName(TestContext context) throws Exception {}``, where methodName could be different per test unit.

Example test unit:

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@Unit
	public void unit_test(TestContext context) throws Exception {
		// --------------------------------------------------------------------------------------------
		context.getLogger().debug("Hello World");
		// --------------------------------------------------------------------------------------------
	}

..





