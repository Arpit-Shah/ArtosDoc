Implement TestCase
******************

Test case is the Java class which meets the following requirements:

* Class is public.
* Class is in the scan path of a test runner.
* Class is annotated with ``@TestCase`` annotation.
* Class implements ``TestExecutable`` interface.
* Class contains at least one test unit.

.. note::
	It is recommended to add a test plan for each test cases using ``@TestPlan`` annotation. 
..

Steps

* Create a new Java class inside the created package structure (In this example : TestCase_1.java)
* Copy and paste below code in newly created Java file.

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
	public class TestCase_1 implements TestExecutable {

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

Recommended test case structures :
##################################

Functional testing :
====================

* Use a separate test case for each test aim.
* Each test case contains only one test unit.
* All decision based annotations (Example : @Group, @KnownToFail, @ExpectedException) are to be applied to test class.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.ExpectedException;
	import com.artos.annotation.KnownToFail;
	import com.artos.annotation.Group;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@Group(group = { "AUTOMATED" })
	@KnownToFail(ktf = false, bugref = "JIRA-1234")
	@ExpectedException(expectedExceptions = { NullPointerException.class })
	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "GIVEN..AND..THEN...DO Something")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_2 implements TestExecutable {

		@Unit()
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print inside a log file
			context.getLogger().debug("Functional test");
			// --------------------------------------------------------------------------------------------
		}
	}

..

Unit testing :
==============

* Group similar aim units into one test case.
* Test case contains one or more test units.
* All decision based annotations (Example : @Group, @KnownToFail, @ExpectedException) are to be applied to relevant test unit.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.ExpectedException;
	import com.artos.annotation.KnownToFail;
	import com.artos.annotation.Group;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_2 implements TestExecutable {

		@Group(group = { "AUTOMATED" })
		@KnownToFail(ktf = false, bugref = "JIRA-1234")
		@ExpectedException(expectedExceptions = { NullPointerException.class })
		@Unit(skip = false, sequence = 1)
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print inside a log file
			context.getLogger().debug("Unit test 1");
			// --------------------------------------------------------------------------------------------
		}

		@Group(group = { "SEMI_AUTOMATED" })
		@KnownToFail(ktf = false, bugref = "JIRA-1234")
		@ExpectedException(expectedExceptions = { NullPointerException.class })
		@Unit(skip = false, sequence = 2)
		public void unit_test2(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print inside a log file
			context.getLogger().debug("Unit test 2");
			// --------------------------------------------------------------------------------------------
		}
	}

..