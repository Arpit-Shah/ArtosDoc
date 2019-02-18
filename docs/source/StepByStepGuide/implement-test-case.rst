Implement TestCase
******************

Test case is the Java class which meets the following requirements:

* Class is ``public``
* Class is annotated with ``@TestCase`` annotation.
* Class implements ``TestExecutable`` interface.
* Class contains at least one test unit.

.. admonition:: Recommended

	Add test plan for each test cases using ``@TestPlan`` annotation. 

..

The test unit is a Java method which meets the following requirements:

* Method is ``public`` and belongs to a test case.
* Method is annotated with ``@Unit`` annotation.
* Method signature is ``public void methodName(TestContext context)``.

.. important::

	* Test units must be independent of each other.
	* All test units are executed using new class instance so variables/objects can not be shared between two test units unless stored in context.
	* Use method ``context.setGlobalObject(key, obj);`` or ``context.setGlobalString(key, str);`` to share objects between test cases.

..


Steps

* Create new Java class inside created package structure (In this example : TestCase_1.java)
* Copy paste below code in newly created Java file.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 9, 10, 11, 13, 23
	:caption: Example: Test case code with multiple test units

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