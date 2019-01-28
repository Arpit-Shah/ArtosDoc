@ExpectedException
******************
Annotation @ExpectedException is used to manage an exception during test where user must specify at lease one exception. User can optionally provide exception message/description either as a string or regular expression to deal with complex scenarios.

.. note::
   String specified in "contains" attribute must be 100% match with exception message/description inclusive of non-printable characters. For partial or dynamic string matching, use regular expression. 

..

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 45, 20, 20
	:stub-columns: 0
	
	expectedExceptions(), One or more exception classes, Mandatory, NA
	contains(), String or regular expression, Optional, Empty String
	enforce(), Enforce exception checking, Optional, true

..

Test combinations and expected outcome
######################################

.. csv-table:: 
	:header: expectedExceptions(), contains(), enforce(), Test Exception, Outcome
	:widths: 15, 15, 15, 40, 15
	:stub-columns: 0
	
	specified, default, true, exception match, PASS 
	specified, specified, true, exception + description match, PASS
	specified, default, true, exception miss-match, FAIL
	specified, specified, true, exception/description miss-match, FAIL
	specified, default, true, no exception, FAIL
	specified, specified, true, no exception, FAIL
	specified, default, false, exception match, PASS 
	specified, specified, false, exception + description match, PASS
	specified, default, false, exception miss-match, FAIL
	specified, specified, false, exception + description miss-match, FAIL
	specified, default, false, no exception, PASS
	specified, specified, false, no exception, PASS

..

Annotation use cases
####################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	// Single exception comparison
	@ExpectedException(expectedExceptions = { NullPointerException.class })
	// Single exception + exception message string comparison
	@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class }, contains = "exception example")
	// Single exception + exception message matching with regular expression
	@ExpectedException(expectedExceptions = { NullPointerException.class }, contains = "[^0-9]*[12]?[0-9]{1,2}[^0-9]*")

	// Multiple exception comparison
	@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class })
	// Multiple exception + exception message string comparison
	@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class }, contains = "exception example")
	// Multiple exception + exception message matching with regular expression
	@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class }, contains = "[^0-9]*[12]?[0-9]{1,2}[^0-9]*")

..

Example functional test case
############################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.ExpectedException;
	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.exception.InvalidDataException;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class }, contains = "exception example")
	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_2 implements TestExecutable {

		@Override
		public void execute(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			throw new NullPointerException("exception example");
			// --------------------------------------------------------------------------------------------
		}
	}

..
..

Example unit test case
######################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.ExpectedException;
	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.exception.InvalidDataException;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	
	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_2 implements TestExecutable {

		@Unit
		@ExpectedException(expectedExceptions = { NullPointerException.class, InvalidDataException.class }, contains = "exception example")
		public void unit_test(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			throw new NullPointerException("exception example");
			// --------------------------------------------------------------------------------------------
		}
	}

..