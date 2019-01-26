Test Suite & Scan Scope
***********************

Test Suite
##########

ARTOS project is a Java project that is made up of one or more test suites. A test suite consists of two components:

* A Runner
* Test cases

A test suite can only execute test cases that are within its Runner's scan scope [1]_. Test suites can share one or more test cases.

Test Runner
###########

The runner is the entry point to a test suite.

* Master Runner - A Runner inside root location of the project [2]_ is called **Master Runner** which has visibility of all test cases within a project.
* Feature Runner - A Runner created inside individual packages is called **Feature Runner**. Feature Runners have visibility of all test cases within same package or its sub-packages.

.. [1] Scan Scope

A section of the Java project that will be scanned during the search of test cases is called a scan scope.

* Master Runner - Entire project test cases are within a scan scope
* Feature Runner - Test cases within same package or its sub-packages are within a scan scope

.. image:: MasterRunner_ScanScope.png

.. [2] Project Root location

* Non-Maven project root location => ``src``.
* Maven project root location => ``src/main/java``.
* In Eclipse IDE root location is also known as "default package".