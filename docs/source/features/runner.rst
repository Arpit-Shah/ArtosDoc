Runner/Test Executor
********************

Purpose:
########

Runner is responsible for sequentializing, executing and tracking test cases from start to end.

Facilities:
###########
	
Artos provides test runner which can execute multiple test suites in parallel. Artos test runner can be launched using one of the following:

* Command line by providing xml test script. 
* main() method execution via IDE.

.. note::
	Artos recognize test cases using ``@TestCase`` annotations, any class without appropriate annotation(s) will be ignored.
