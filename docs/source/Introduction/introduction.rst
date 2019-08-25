Introduction
************

ARTOS (Art of System Testing)
#############################

Welcome to Artos Docs! Here, you can find Artos documentation, guidelines, as well as tips and tricks to help you start a successful test automation journey.

Artos is designed and developed by a team of experienced test engineers as a **free to use** and **open-source** project to help test community throughout the world. It is aimed at providing a test framework that is easy to use, reliable and works out of the box. Artos is written in Java which makes it suitable for Windows, Linux, MAC or any platform that runs Java. It can be used for functional, system, end to end and/or unit testing. Artos includes simple but powerful runner as well as many inbuilt and well-tested utilities that will save time for users to let them focus on what they do best!

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
   @AfterFailedUnit	 , Method 		 , "Denotes that the annotated method should be executed after each failed test unit execution"
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