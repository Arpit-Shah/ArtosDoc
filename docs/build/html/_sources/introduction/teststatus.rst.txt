Test Status
***********

ARTOS supported test status and test severity is listed below.

.. csv-table:: 
    :header: Status, Severity, Usage
    :widths: 15, 20, 65
    :stub-columns: 0
    
    PASS, 0, Test case executed without any errors
    SKIP, 1, Test case execution is skipped
    KTF, 2, Test case is known to fail
    FAIL, 3, Test case failed

..

Test status allows user to update test status during test unit execution. Test status can be updated as frequently as required. Each status update will be visible in log file. Highest severity status update is recorded as test outcome.

Test status can be updated using: ``TestContext().setTestStatus(TestStatus.FAIL, "Test did bad thing..");``

.. note:: It is recommended that short description/reason provided during test status update.

**Example:** Below sample code updates test status multiple time in single test unit. Most sever status update is ``TestStatus.FAIL`` thus test outcome will be **FAIL**.

.. code-block:: Java
    :linenos:
    :emphasize-lines: 23

    package com.tests;

    import com.artos.annotation.TestCase;
    import com.artos.annotation.TestPlan;
    import com.artos.annotation.Unit;
    import com.artos.framework.infra.TestContext;
    import com.artos.interfaces.TestExecutable;

    @TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "GIVEN..WHEN..AND..THEN..")
    @TestCase()
    public class TestCase_1 implements TestExecutable {

        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.FAIL, "Test flow is not as expected");

            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.PASS, "Test flow is as expected");
            // --------------------------------------------------------------------------------------------
        }
    }

..

TestUnit vs TestCase Status
###########################

* Test unit outcome is most sever test status update during test unit execution. 
* Test case outcome is most sever test outcome among all the test units execution.

**Example:** Below sample code has multiple test units with different outcomes. Most sever test unit outcome is set as test case outcome that is **FAIL**.

.. code-block:: Java
    :linenos:
    :emphasize-lines: 19, 28, 37, 46

    package com.tests;

    import com.artos.annotation.TestCase;
    import com.artos.annotation.TestPlan;
    import com.artos.annotation.Unit;
    import com.artos.framework.infra.TestContext;
    import com.artos.interfaces.TestExecutable;

    // TestCase outcome is FAIL
    @TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "GIVEN..WHEN..AND..THEN..")
    @TestCase()
    public class TestCase_1 implements TestExecutable {

        // TestUnit outcome  is FAIL
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.FAIL, "Test fails");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is PASS
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.PASS, "Test passes");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is KTF
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.KTF, "Test is known to fail");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is SKIP
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            TestContext().setTestStatus(TestStatus.SKIP, "Test is skipped");
            // --------------------------------------------------------------------------------------------
        }
    }

..