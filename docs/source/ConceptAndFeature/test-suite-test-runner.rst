Test Suite & Test Runner
************************

Scan Scope
##########

A class containing ``main()`` method that initializes runner object is called a **Runner**. Upon test execution, a Java package containing Runner and it's child packages are scanned by the Runner in search of test cases, thus scanned section of the project is called a **Scan Scope** of the Runner.  

.. image:: ScanScope.png

The Runner
##########

* A Runner is the entry point to a test application. 
* A Runner at project root location [1]_ is called a **Master Runner** which has visibility of all test cases within a project.
* A Runner created within the individual package is called a **Feature Runner** which has visibility inside its package or its child-packages.
* A test project can have more than one Runner.

.. [1] Project Root location

.. admonition:: Important

	Project root can be different depending on the project configuration. Below guideline is written with default project setup in mind.

..

* Non-Maven project root location => ``src``.
* Maven project root location => ``src/main/java``.
* **Eclipse IDE** root location is also known as "default package".

    .. image:: RunnerType.png

Test Suite
##########

* A Runner and test cases within Runner's scan scope combined constructs a **Test Suite**.
* A project contains as many test suites as a number of test Runners.
* A test suite can not execute test cases outside its Runner's scan scope.
* Test suites may share one or more test cases.

    .. image:: MasterRunner_ScanScope.png