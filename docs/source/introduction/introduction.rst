ARTOS (Art of System Testing)
*****************************
ARTOS is developed by a team of experienced test engineers for test developers/engineers. It was designed and developed to provide a test framework which is easy to use, reliable and works out of the box. ARTOS is written in Java which makes it suitable for Windows, Linux, MAC or any other platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Most test frameworks only provide the test runner while the rest is left on engineers to develop, whereas ARTOS comes with many inbuilt and well-tested utilities saving time for users to focus on what they do best!

Artos feature highlight
#######################

* Built-in and pre-configured log framework

   * Organized logging for ease of use
   * Text or HTML formatted logs 
   * Log levels support
   * Real-time log files in addition to a general log file (for performance measurement)
   * Runtime log enable/disable
   * Tracking of generated log files
   * Separate log files per test suite during parallel testing

* Built-in report generation

   * Professional looking Extent report
   * Text or HTML formatted report
   * Separate test reports per test suite during parallel testing

* Test time measurement

    * Test-suite, test-case and test-units execution duration measurement with millisecond accuracy

* Test importance
    
    * Test importance is highlighted to focus on important test cases

* Easy debugging
   
   * GUI test selector for selective testing and avoids user error
   * FAIL stamp injection in the log file to pinpoint the exact line of failure
   * Failure highlight at the end of test suite execution
   * Bug reference reporting against the failed test case
   * Test time tracking with millisecond accuracy
   * BDD formatted test plan injection in the log file to avoid a disconnect between test plan and test case

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

* Parallel testing

   * Run test suites in parallel using test script
   * Separate logs per test suite execution
   * Separate extent reports per test suite execution

* BDD (Behavior driven development)
   
   * Accepts Cucumber generated feature file for BDD testing
   * Auto generated BDD test templates to speed up development
   * BDD skeleton generation in case of missing methods

* Additional features

   * Stop on fail support
   * Multiple framework configurations supported using a test profile
   * Automated test script generation
   * Automated script generation for failed test cases
   * Failed test case marker

* Listeners

   * Listeners are supported for future plug-in or application development. 

Framework glossary
##################

.. csv-table:: 
   :header: **Keyword**, **Description**
   :widths: 27, 73
   :stub-columns: 0
   
   Test suite        , "A collection of test cases that are designed specifically to test the system under test"
   Test runner       , "A class which is the entry point to a test application. It is responsible for running and tracking test cases from the start to end"
   Test case         , "A class which contains set of instructions that will be performed on the system under test"
   Test unit         , "A method within a test case that represents the smallest and independent executable unit"
   Test context      , "A container object that stores and tracks test suite, test case and test unit related information"
   Test script       , "A set of instructions to guide the test runner on how to execute test cases. The test script is represented by xml script"
   Scan scope        , "A section of the Java project which will be scanned during the search of test cases"
   Test status       , "The state of a test case at the time of execution (namely: PASS, FAIL, SKIP or KTF)"
   Unit outcome      , "The outcome of the test unit (namely: PASS, FAIL, SKIP or KTF)"
   Test outcome      , "The outcome of the test case (namely: PASS, FAIL, SKIP or KTF)"
   Fail stamp        , "The text stamp added to a log stream at the line of failure"
   GUI test selector , "Prompt that displays scoped test cases and allow the user to run selective test cases"
   Failure highlight , "Textually representation of failed test cases and its unit for user"

..

Abbreviations
#############

.. csv-table:: 
   :header: **Abbreviation**, **Description**
   :widths: 17, 83
   :stub-columns: 0
   
   KTF , "Known To Fail"
   GUI , "Graphic user interface"

..

Annotations
###########

ARTOS uses Java annotations for most of the feature sets. A list of supported annotations is provided below. Annotation in detail will be covered in later sections.

.. csv-table:: 
   :header: **Annotation**, **Applies To**, **Usage**
   :widths: 22, 15, 63
   :stub-columns: 0

   @TestCase         , Class         , "Denotes that class is a test case"
   @TestPlan         , Class         , "Declares information required for test plan"
   @Unit             , Method        , "Denotes that method is a test unit"
   @BeforeTestSuite  , Method        , "Denotes that the annotated method should be executed once before test suite execution"
   @AfterTestSuite   , Method        , "Denotes that the annotated method should be executed once after test suite execution"
   @BeforeTest       , Method        , "Denotes that the annotated method should be executed before each test case execution"
   @AfterTest        , Method        , "Denotes that the annotated method should be executed after each test case execution"
   @BeforeTestUnit   , Method        , "Denotes that the annotated method should be executed before each test unit execution"
   @AfterTestUnit    , Method        , "Denotes that the annotated method should be executed after each test unit execution"
   @DataProvider     , Method        , "Denotes that the annotated method is the supplier of a test data and declares a unique name for the method"
   @ExpectedException, Method        , "Declares rules of managing exception of the annotated method"
   @Group            , Class/Method  , "Declares group name(s) that the annotated test case/unit belongs to" 
   @KnownToFail      , Method        , "Declares that the annotated test unit is known to fail"
   @TestImportance   , Class/method  , "Declares importance of the annotated test case/unit"
   @StepDefinition   , method        , "Declares step definition that binds test unit to feature file"

..

Example test case and unit
##########################

.. code-block:: Java
   :linenos: 
   :emphasize-lines: 7,8,9,10,13,14,15,22,23,24

   import com.artos.annotation.*;
   import com.artos.framework.Enums.Importance;
   import com.artos.framework.Enums.TestStatus;
   import com.artos.framework.infra.TestContext;
   import com.artos.interfaces.TestExecutable;

   @TestImportance(Importance.CRITICAL)
   @Group(group = "Regression")
   @TestPlan(preparedBy = "ArtosTeam", bdd = "GIVEN..WHEN..AND..THEN..")
   @TestCase(sequence = 1)
   public class Sample_1 implements TestExecutable {

      @Group(group = "BADPATH")
      @TestImportance(Importance.LOW)
      @Unit(sequence = 1)
      public void testUnit_1(TestContext context) {
         // --------------------------------------------------
         context.setTestStatus(TestStatus.FAIL, "Bad path");
         // --------------------------------------------------
      }
      
      @Group(group = "GOODPATH")
      @TestImportance(Importance.HIGH)
      @Unit(sequence = 2)
      public void testUnit_2(TestContext context) {
         // ---------------------------------------------------
         context.setTestStatus(TestStatus.PASS, "Good path");
         // ---------------------------------------------------
      }

   }

..