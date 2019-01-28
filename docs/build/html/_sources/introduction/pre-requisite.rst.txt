.. _Artos_Maven_Repository: https://mvnrepository.com/artifact/com.theartos/artos/
.. _Artos_Eclipse_Template: https://github.com/Arpit-Shah/Artos/tree/master/src/com/artos/template/

Project Pre-Requisite
*********************

Add Artos Jar as a dependency
#############################

* Non-Maven Projects

	* Download latest Artos jar from location - Artos_Maven_Repository_.
	* Add jar to project build path.

* Maven Projects

	* Copy latest jar dependency xml block from location - Artos_Maven_Repository_.
	* Add dependency to project pom.xml file

	.. code-block:: xml
		:linenos:
		:emphasize-lines: 0
		
		<!-- Example dependency block -->
		<dependency>
			<groupId>com.theartos</groupId>
			<artifactId>artos</artifactId>
			<version>x.x.xx</version>
		</dependency>

	.. 

Eclipse SDK
###########

Install ANSI plug-in for Linux OS
=================================

* Go to Eclipse SDK => Help => Eclipse Marketplace.
* Find "ANSI escape in console" plug-in.
* Install plug-in.
* Restart Eclipse SDK.

Configure test templates
========================

The use of a Java template increases consistency and test development speed. Templates can be modified to suite business requirements.

Import default templates:

* Download file **template.xml** from location : Artos_Eclipse_Template_ .
* In Eclipse SDK browse to Window => Preferences => Java => Editor => Templates.
* Click on Import button.
* Import downloaded template.xml file.
* Two templates will be added

	* Artos_Runner
	* Artos_TestCase

Use template:

* Create new Java class.
* Select and delete all the content of the class.
* Type **art** and press **CTRL+SPACE**.
* Template suggestion list will appear so user can select appropriate template.

.. image:: TemplateSelection.png