Use Test Status
***************

Test status allows user to update test status during test unit execution. Test status can be updated as frequently as required. Each status update will be visible in log file. Highest severity status update is recorded as test outcome.

.. csv-table:: 
    :header: Status, Severity, Usage
    :widths: 15, 20, 65
    :stub-columns: 0
    
    PASS    , 0, "Test case/unit executed without any errors"
    SKIP    , 1, "Test case/unit execution is skipped"
    KTF     , 2, "Test case/unit is known to fail"
    FAIL    , 3, "Test case/unit failed"

..

.. code-block:: Java
    :linenos:
    :emphasize-lines: 0
    :caption: : Test status can be updated using following method. It is recommended to add helpful description during each status update.

    context.setTestStatus(TestStatus.FAIL, "Test did bad thing..");

..

.. code-block:: Java
    :linenos:
    :emphasize-lines: 23
    :caption: : In this example test status is updated multiple time in single test unit. The most sever update out of all status updates will be considered as test unit outcome. In this example sever status update is **TestStatus.FAIL** so test unit outcome will be **FAIL**. Because there is only one test unit in the test case, the test case outcome is also **FAIL**.

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
            // --------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.FAIL, "Test flow is not as expected");

            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test flow is as expected");
            // ---------------------------------------------------------
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
    :caption: : In this example test outcome for each test unit is different. The most sever outcome among all test units will be considered as a test case outcome. In this example sever outcome is **TestStatus.FAIL** so test case outcome will be **FAIL**.

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
            // --------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.FAIL, "Test fails");
            // --------------------------------------------------------
        }

        // TestUnit outcome  is PASS
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.PASS, "Test passes");
            // --------------------------------------------------------
        }

        // TestUnit outcome  is KTF
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.KTF, "Test is known to fail");
            // --------------------------------------------------------
        }

        // TestUnit outcome  is SKIP
        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------
            // TODO : logic goes here..
            context.setTestStatus(TestStatus.SKIP, "Test is skipped");
            // --------------------------------------------------------
        }
    }

..