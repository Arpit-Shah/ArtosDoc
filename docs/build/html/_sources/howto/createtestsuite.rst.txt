Create a TestSuite
******************

Test suite is a Java package which meets following requirements

* Package contains at least one runner.
* Package contains at least one test case.

Steps

* Users are open to structure test project the way it suite their needs. following examples are merely the suggestions.
* Location of runner class defines how structure will see test cases.

Feature based structure :
#########################

* Packages are organized based on features.
* Each package acts as a test suite.
* Each package contains a runner and test cases.
* Test cases could be within same package and/or child packages.
* Test runner will see test classes within same or child packages.

.. image:: ProjectStructure_Features.png

Super structure :
#################

* Packages are organized based on features or a test group.
* Entire project act as single test suite
* Project contains single runner which is in parent position to all other packages.
* Test runner will see all test classes at once.

.. image:: ProjectStructure_Super.png

Feature tree :
##############

This structure caters for project which may require feature based and/or super structure.

* Packages are organized based on features or a test group.
* Project can act as a single or multiple test suites.
* Project contains more than one runner but at least one which is in parent position to all other packages.
* Depending on the runner used, project may see limited or all test cases.

.. image:: ProjectStructure_FeatureTree.png
