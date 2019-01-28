Run Test Project
****************

ARTOS can be run via

* Command line
* IDE (Example : Eclipse, IntelliJ etc..)

Command line
############

* Artos can be executed via command line by specifying minimum of

	* All library in the class path (Specify all dependencies)
	* Test runner class for given test suite (Starting point of test application)
	* Test script for given test suite (Contain all instructions to execute test suite correctly)
	* Profile name (helps in selection of correct framework configuration)

.. code-block:: Text
	:linenos:
	:emphasize-lines: 8

	// Current example is written with following assumption: 
	// * Test project only has artos-0.0.1.jar and testproject.jar as a dependency. 
	// * artos-0.0.1.jar is located at .\lib\artos-0.0.1.jar.
	// * Test script is located at .\script\testscript.xml.
	// * Class with main method name is TestRunner.java (Test runner).
	// * "dev" profile is used from framework_configuration.xml. 
	
	java -cp .\lib\artos-0.0.1.jar .\lib\testproject.jar TestRunner --testscript=".\script\testscript.xml" --profile="dev"

.. 

Eclipse IDE
###########

Using Runner Class
==================

* Right click on the test runner class.
* Select options Run as => Java Application.

.. image:: RunJavaApplication.png