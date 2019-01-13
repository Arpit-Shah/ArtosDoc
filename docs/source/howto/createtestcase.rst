Create a TestCase
******************

Test case is a Java class which meets following requirements

* Class is public.
* Class is in the scan path of a test runner.
* Class is annotated with ``@TestCase`` annotation.
* Class implements ``TestExecutable`` interface.
* Class contains at least one test unit.

Steps

* Create new Java class inside created package structure (In this example : TestCase_2.java)
* Copy paste below code in newly created Java file.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "given project has no errors then hello world will be printed")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_2 implements TestExecutable {

		@Unit(skip = false, sequence = 1)
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print on console
			System.out.println("Hello World 1");
			// Print inside a log file
			context.getLogger().debug("Hello World 1");
			// --------------------------------------------------------------------------------------------
		}

		@Unit(skip = false, sequence = 2)
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