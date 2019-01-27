Implement TestCase
******************

Test case is the Java class which meets the following requirements:

* Class is ``public`` and annotated with ``@TestCase`` annotation.
* Class implements ``TestExecutable`` interface.
* Class contains at least one test unit.

.. note:: Recommended to add a test plan for each test cases using ``@TestPlan`` annotation. 

Steps

* Create a new Java class inside the created package structure (In this example : TestCase_1.java)
* Copy and paste below code in newly created Java file.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 10, 11

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "Given project has no errors then Hello World will be printed on console and a log file")
	@TestCase()
	public class TestCase_1 implements TestExecutable {

		@Unit()
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print on console
			System.out.println("Hello World 1");
			// Print inside a log file
			context.getLogger().debug("Hello World 1");
			// --------------------------------------------------------------------------------------------
		}

		@Unit()
		public void unit_test2(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print on console
			System.out.println("Hello World 2");
			// Print inside a log file
			context.getLogger().debug("Hello World 2");
			// --------------------------------------------------------------------------------------------
		}
	}

..