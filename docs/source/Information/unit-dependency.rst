@UnitDependency
***************
Annotation @UnitDependency is used to declare unit dependency on other units withing same test case. One or more unit name can be declared as a dependency.
If dependency is declared and any of the following requirements are **not met** then unit execution will be skipped.

Requirements:

* Declared dependency unit(s) must be within a same test case.
* Declared dependency unit(s) execution must be completed before declaring unit execution. 
* Declared dependency unit(s) outcome must be **PASS**.

Warning will be printed when unit execution is skipped due to dependency requirements not met.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	=========================================================================
	================ DEPENDENCY REQUIREMENTS ARE NOT MET ====================
	===================== TEST UNIT WILL BE SKIPPED =========================
	=========================================================================

.. 

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 40, 25, 20
	:stub-columns: 0
	
	dependency(), Array of method name, Mandatory, N/A

..

Annotation use case(s)
######################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@UnitDependency(dependency = { "TestUnit_1", "TestCase_2" })

..

Example test case
#################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 19

	@TestPlan(preparedBy = "user", preparationDate = "19/02/2019", bdd = "GIVEN..WHEN..AND..THEN..")
	@TestCase(sequence = 1)
	public class TestCase_1 implements TestExecutable {

	@Unit(sequence = 1)
	public void testUnit_1(TestContext context) {
		// --------------------------------------------------------------------------------------------
		context.getLogger().info("do something");
		// --------------------------------------------------------------------------------------------
	}

	@Unit(sequence = 2)
	public void testUnit_2(TestContext context) {
		// --------------------------------------------------------------------------------------------
		context.getLogger().info("do something");
		// --------------------------------------------------------------------------------------------
	}

	@UnitDependency(dependency = { "testUnit_1", "testUnit_2" })
	@Unit(sequence = 3)
	public void testUnit_3(TestContext context) {
		// --------------------------------------------------------------------------------------------
		context.getLogger().info("do something");
		// --------------------------------------------------------------------------------------------
	}

}

..