Implement TestCase and TestUnits
********************************

The test case is the Java class which meets the following requirements:

* Class is ``public`` and annotated with ``@TestCase`` annotation.
* Class implements ``TestExecutable`` interface.

The test unit is a Java method which meets the following requirements:

* Method is ``public`` and belongs to a test case.
* Method is annotated with ``@Unit`` annotation.
* Method signature is ``public void methodName(TestContext context)``.

.. admonition:: Recommended

    A test plan can be added to a test case or a test unit using ``@TestPlan`` annotation. 

..

Steps

* Create new Java class inside created package structure.
* Use the template to generate test case skeleton.
* Add details and test units as required.

.. code-block:: Java
    :linenos:
    :emphasize-lines: 9, 10, 11, 13, 23
    :caption: Example: Test case with multiple test units

    package com.tests;

    import com.artos.annotation.TestCase;
    import com.artos.annotation.TestPlan;
    import com.artos.annotation.Unit;
    import com.artos.framework.infra.TestContext;
    import com.artos.interfaces.TestExecutable;

    @TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "given project has no errors then hello world will be printed")
    @TestCase()
    public class TestCase_1 implements TestExecutable {

        @Unit()
        public void unit_test1(TestContext context) throws Exception {
            // --------------------------------------------------------
            // Print on console
            System.out.println("Hello World 1");
            // Print inside a log file
            context.getLogger().debug("Hello World 1");
            // --------------------------------------------------------
        }

        @Unit()
        public void unit_test2(TestContext context) throws Exception {
            // --------------------------------------------------------
            // Print on console
            System.out.println("Hello World 2");
            // Print inside a log file
            context.getLogger().debug(doSomething());
            // --------------------------------------------------------
        }

        // This method is not a test unit
        public String doSomething() {
            return "Hello World 2";
        }
    }

..