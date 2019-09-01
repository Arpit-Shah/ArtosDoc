@TestDependency
***************
Annotation @TestDependency is used to declare test case dependency on other test classes. One or more test cases can be declared as a dependency.
If dependency is declared and any of the following requirements are **not met** then test case execution will be skipped.

Requirements:

* Declared dependency test case must be within a scan scope.
* Declared dependency test case execution must be completed before declaring test case execution. 
* Declared dependency test case outcome must be **PASS**.

Warning will be printed when test case execution is skipped due to dependency requirements not met.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	=========================================================================
	================ DEPENDENCY REQUIREMENTS ARE NOT MET ====================
	===================== TESTCASE WILL BE DROPPED ==========================
	=========================================================================

.. 

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 40, 25, 20
	:stub-columns: 0
	
	dependency(), Array of Test Cases, Mandatory, N/A

..

Annotation use case(s)
######################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@TestDependency(dependency = { TestCase_1.class, TestCase_2.class })

..

Example test case
#################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 7

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;
	import com.artos.annotation.TestDependency;

	@TestDependency(dependency = { TestCase_1.class, TestCase_2.class })
	@TestCase(skip = false, sequence = 1, bugref = "JIRA-1234, JIRA-234", dropRemainingTestsUponFailure = true)
	public class TestCase_1 implements TestExecutable {

	}

..