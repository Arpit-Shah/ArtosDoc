Use Test Status
***************

Test status allows user to update test status during test unit execution. Test status can be updated as frequently as required. Each status update will be visible in log file. Highest severity status update is recorded as test outcome.

.. csv-table:: 
    :header: Status, Severity, Usage
    :widths: 15, 20, 65
    :stub-columns: 0
    
    PASS, 0, Test case/unit executed without any errors
    SKIP, 1, Test case/unit execution is skipped
    KTF, 2, Test case/unit is known to fail
    FAIL, 3, Test case/unit failed

..

Test status can be updated using a method ``context.setTestStatus(TestStatus.FAIL, "Test did bad thing..");``

.. admonition:: Recommended

    Add short description during every status update.

..

.. code-block:: Java
    :linenos:
    :emphasize-lines: 23
    :caption: Example code with multiple status updates. Outcome will be **FAIL**

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
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.FAIL, "Test flow is not as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");
            // --------------------------------------------------------------------------------------------
        }
    }

..

TestUnit vs TestCase Status
###########################

* Test unit outcome is most sever test status update during test unit execution. 
* Test case outcome is most sever test outcome among all the test units execution.

.. code-block:: Java
    :linenos:
    :emphasize-lines: 19, 28, 37, 46
    :caption: Example code with multiple unit outcomes. TestCase outcome will be **FAIL**

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
            context.setTestStatus(TestStatus.FAIL, "Test fails");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is PASS
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test passes");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is KTF
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.KTF, "Test is known to fail");
            // --------------------------------------------------------------------------------------------
        }

        // TestUnit outcome  is SKIP
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.SKIP, "Test is skipped");
            // --------------------------------------------------------------------------------------------
        }
    }

..