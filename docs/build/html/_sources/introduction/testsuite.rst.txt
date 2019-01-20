Test Suite & Scan Scope
***********************

Test Suite
##########

ARTOS project is the Java project that is made up of one or more test suites. A test suite consists of two components:

* A runner
* Test cases

Scan Scope
##########

A section of the Java project that will be scanned during the search of test cases is called a scan scope.

* The runner is the entry point to a test suite and scans for test cases within:

	* Package containing the runner class **AND**
	* Child packages of the package containing the runner class.

.. image:: ProjectStructure_ScanScope.png

* A Test suite can only execute test cases that are within the runner's scan scope.
* Test suites can share one or more test cases. Example as shown below:

	* Test Suite1 shares test cases with Suite2 and Suite3.
	* Test Suite2 and Suite3 do not share any test cases with each other.

.. image:: ProjectStructure_ScanScope.png