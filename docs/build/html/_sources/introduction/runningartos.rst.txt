Running Artos
*************

Artos can be run via

* Command line
* IDE (Example : Eclipse, IntelliJ etc..)

Command line
############

.. code-block:: Text
	:linenos:
	:emphasize-lines: 6

	// Current example is written with following assumption 
	// * Test project only has **artos.jar** as a dependency. 
	// * Artos jar is located at **.\lib\artos.jar**.
	// * Test script is located at **.\script\testscript.xml**.
	// * Test runner class name is **TestRunner.java** (Runner = Class which contains main() method).
	java -cp .\lib\artos-0.0.1.jar TestRunner --testscript=".\script\testscript.xml"

.. 

Eclipse IDE
###########

* Right click on the test runner class.
* Select options Run as => Java Application .

.. image:: RunJavaApplication.png