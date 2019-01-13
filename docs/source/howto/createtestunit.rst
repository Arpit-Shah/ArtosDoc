Create a TestUnit
*****************

Test unit is a Java method which meets following requirements

* Method is public.
* Method belongs to a class annotated as test case.
* Method is annotated with ``@Unit`` annotation.
* Method signature is ``public void methodName(TestContext context)``.
* Method is independent from other test units.

.. note::
	* Test unit must be independent of each other. All test units are executed using new class instance so variables/objects can not be shared between two test units.
	* Use **context.setGlobalObject(key, obj);** to store objects which required to available through out test suite.
	* Test case may contain methods which are not marked as test unit.
..

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
			context.getLogger().debug(doSomething());
			// --------------------------------------------------------------------------------------------
		}

		// This method is not a test unit
		public String doSomething() {
			return "Hello World 2";
		}
	}

..