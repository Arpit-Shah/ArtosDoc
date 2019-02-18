@ExpectedException
******************
Annotation @ExpectedException is used to manage an exception during test where user must specify at lease one exception. User can optionally provide exception message/description either as a string or regular expression to deal with complex scenarios.

.. note::
   String specified in "contains" attribute must be 100% match with exception message/description inclusive of non-printable characters. For partial or dynamic string matching, use regular expression. 

..

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 25, 30, 25, 20
	:stub-columns: 0
	
	expectedExceptions(), One or more exception classes, Mandatory, NA
	contains(), String or regular expression, Optional, Empty String
	enforce(), Enforce exception checking, Optional, true

..

Test combinations and expected outcome
######################################

.. csv-table:: 
	:header: expectedExceptions(), contains(), enforce(), Test Exception, Outcome
	:widths: 25, 15, 12, 35, 13
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

Example usage
#############

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "GIVEN..WHEN..AND..THEN..")
	@TestCase(sequence = 1)
	public class Sample_ExpectedException implements TestExecutable {

		
		// Code demonstrates how to specify single expected exception class
		// Test Unit execution will be terminated as soon as exception is
		// thrown and next test unit will be run. If Exception is not as
		// expected or exception did not occur then test unit will be
		// marked as a FAIL
		@Unit(sequence = 1)
		@ExpectedException(expectedExceptions = { NumberFormatException.class })
		public void testUnit_1(TestContext context) {
			// ------------------------------------------------
			// Converting String into Integer should throw an error
			Integer.parseInt("Test");
			// ------------------------------------------------
		}

		// Code demonstrates how to specify multiple expected exception
		// classes. Test Unit execution will be terminated as soon as
		// exception is thrown and next test unit will be run.
		// If Exception is not as expected or exception did not occur
		// then test unit will be marked as a FAIL
		@Unit(sequence = 2)
		@ExpectedException(expectedExceptions = { Exception.class, NumberFormatException.class })
		public void testUnit_2(TestContext context) {
			// ------------------------------------------------
			// Converting String into Integer should throw an error
			Integer.parseInt("Test");
			// ------------------------------------------------
		}

		// Code demonstrates how to specify multiple expected exception
		// classes and description. Test Unit execution will be terminated
		// as soon as exception is thrown and next test unit will be run. 
		// If Exception is not as expected or exception did not occur then
		// test unit will be marked as a FAIL
		@Unit(sequence = 3)
		@ExpectedException(expectedExceptions = { Exception.class, NumberFormatException.class }, contains = "This is a test code")
		public void testUnit_3(TestContext context) throws Exception {
			// ------------------------------------------------
			// test logic goes here..
			throw new Exception("This is a test code");
			// ------------------------------------------------
		}

		// Code demonstrates how to specify multiple expected exception
		// classes and description using Regular expression. Test Unit
		// execution will be terminated as soon as exception is thrown
		// and next test unit will be run. If Exception is not as
		// expected or exception did not occur then test unit will be
		// marked as a FAIL
		@Unit(sequence = 4)
		@ExpectedException(expectedExceptions = { Exception.class, NumberFormatException.class }, contains = ".*\\btest\\b.*")
		public void testUnit_4(TestContext context) throws Exception {
			// -------------------------------------------------
			// test logic goes here..
			throw new Exception("This is a test code");
			// -------------------------------------------------
		}

		// Code demonstrates how to specify exception but do not enforce
		// fail in absence of exception. If Exception is thrown then it
		// will be matched with expectedException class. If Exception
		// will not be thrown then test will continue execution and PASS
		// eventually
		@Unit(sequence = 5)
		@ExpectedException(enforce = false, expectedExceptions = { Exception.class, NumberFormatException.class })
		public void testUnit_5(TestContext context) throws Exception {
			// -------------------------------------------------
			// test logic goes here..
			context.getLogger().info("This test does not throw any exception");
			// -------------------------------------------------
		}

		// This will allow user to continue executing rest of the code
		// in case of exception. Guarding against wrong flow will help
		// user throw exception in case code did not do what was expected
		@Unit(sequence = 6)
		public void testUnit_6(TestContext context) throws Exception {
			// ---------------------------------------------------
			try {
				// Converting String into Integer should throw an error
				Integer.parseInt("Test");

				// Protects against code traveling in wrong direction
				Guard.guardWrongFlow("Expected exception but did not occur");

			} catch (NumberFormatException e) {
				if (!e.getMessage().equals("For input string: \"Test\"")) {
					throw e;
				}
			}

			context.getLogger().info("Do something..");
			// logic goes here..
			// --------------------------------------------------
		}
	}

..