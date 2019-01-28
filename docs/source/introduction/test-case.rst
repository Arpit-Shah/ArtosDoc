@TestCase
*********
Annotation @TestCase is used to mark java class as a test case. 

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 45, 20, 20
	:stub-columns: 0
	
	skip(), Skip or Keep, Optional, false
	sequence(), Test sequence number, Optional, 0
	label(), Test label, Optional, Empty String
	dataprovider(), Data provider method Name, Optional, Empty String
	testtimeout(), Test timeout in milliseconds, Optional, 0

..

* skip() 
	* Temporarily removes test case from execution list, skipped test case will not appear in GUI test selector.
	* Skip attribute will be applied regardless of test execution method (test list, test script or test scanning).
* sequence()
	* Provides sequence number to a test case. 
	* Test case(s) are assigned sequence number '0' if no sequence number is specified by the user.
	* Sequence number is ignored in case of test sequence is provided by the user (via test script or test list).
	* In absence of user provided test sequence (empty test list in the test-script or empty/null test list), test case execution sequence will be decided by first sorting packages by name in ascending order and secondly bubble sorting test cases using sequence number within their respective packages.
	* Test cases are sorted using bubble sort mechanism so any test case(s) (within same package) with same sequence number will be arranged as per their scan order, thus between them order of execution cannot be guaranteed.
* label()
	* Reserved for future use. 
* dataprovider()
	* Used to specify data provider method name which provides 2D data array in return. 
	* Test case is repeatedly executed until all data from the array is applied.
	* Data provider method name is case in-sensitive.
	* If mentioned method is not found or not visible or not valid then test execution will stop prior to test suite launch.
* testtimeout() 
	* Used to set test execution timeout.
	* Test case will be marked failed if test execution takes longer than specified time. 
	* 0 timeout means infinite timeout.
	* timeout is in milliseconds.

Annotation use case(s)
######################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@TestCase(skip = false, sequence = 1, label = { "Regression" }, dataprovider = "username", testtimeout = 5000)

..

Example test case
#################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestCase(skip = false, sequence = 1, label = { "Regression" }, dataprovider = "username", testtimeout = 5000)
	public class TestCase_1 implements TestExecutable {

	}

..