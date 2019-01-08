Test Status
***********

Purpose:
########

	* Test status allows user to provide useful status updates during test case execution and conclude outcome.
	* User can provide short description/reason string during test status update.
	
Facilities:
###########

* User can update test status multiple times within one test case execution.
* Among all updated status, status with worst outcome will be considered as outcome/result of the test case.

>>> Example:
During single test case execution, A test case status is updated in the following sequence:
PASS => PASS => FAIL => PASS
Then outcome of the test case will be **FAIL** because that is the worst outcome.

* Supported Test Status

.. csv-table:: 
    :header: Status, Usage when, Order (higher order = worst outcome)
    :widths: 15, 65, 20
    :stub-columns: 0
    
    PASS, Test case executed without any errors, 0
    SKIP, Test case is skipped, 1
    KTF, Test case is known to fail, 2
    FAIL, Test case failed, 3

..

Usage:
######

.. code-block:: Java

    // Test status can be updated using following method
    TestContext().setTestStatus(TestStatus.FAIL, "Did not expect to reach here");

..
