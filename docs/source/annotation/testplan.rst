@TestPlan
*********
Annotation @TestPlan is used to describe short BDD (Behavior Driven Development) or Simple text styled test plan. If attribute "bdd" is specified by user then bdd text is formatted and then printed in the log file during test execution. This annotation encourages user to maintain test plan within a test case.

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 45, 20, 20
	:stub-columns: 0
	
	description(), Short description, Optional, Empty String
	preparedBy(), Test developer/engineer name, Optional, Empty String
	preparationDate(), Test preparation date, Optional, Empty String
	reviewedBy(), Reviewer name, Optional, Empty String
	reviewDate(), Review date, Optional, Empty String
	bdd(), BDD style test plan, Optional, Empty String

..

Annotation use cases
####################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@TestPlan(description = "Automated Test Case", preparedBy = "ArpitS", preparationDate = "1/1/2018", reviewedBy = "ArpitS", reviewDate = "1/2/2018", bdd = "GIVEN..AND..WHEN..THEN..")

..

Example test case
#################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "arpit", preparationDate = "1/1/2018", bdd = "given test project is set correctly and logger is used to log HELLO WORLD string then hello world should be printed correctly")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_1 implements TestExecutable {

		@Unit
		public void unit_test(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			context.getLogger().debug("Observe formatted test plan in the log file");
			// --------------------------------------------------------------------------------------------
		}
	}

..

* Log file snapshot for above test case.

.. code-block:: Text
	:linenos:
	:emphasize-lines: 0

	*************************************************************************
	Test Name	: com.tests.TestCase_1
	Written BY	: ArpitS
	Date		: 1/1/2018
	BDD Test Plan	: 
	GIVEN test project is set correctly 
	AND logger is used to log HELLO WORLD string 
	THEN hello world should be printed correctly
	*************************************************************************
	Observe formatted test plan in the log file

	[PASS] : unit_test()


	Test Result : PASS

..