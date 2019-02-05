TestScript
**********

Test script is XML file used to instruct test Runner on how to execute test suite.

	* Test script overrides configuration specified in the Runner class.
	* Test script can only be specified using command line argument. 
	* Test script must be present inside script directory of the project.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Sample test script

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<configuration version="1">
	  <suite loopcount="1" name="SuiteName">
	    <tests>
	      <test name="com.featureXYZ.TestCase_1"/>
	      <test name="com.featureXYZ.TestCase_2"/>
	    </tests>
	    <parameters>
	      <parameter name="PARAMETER_0">parameterValue_0</parameter>
	      <parameter name="PARAMETER_1">parameterValue_1</parameter>
	      <parameter name="PARAMETER_2">parameterValue_2</parameter>
	    </parameters>
	    <testcasegroups>
	      <group name="*"/>
	    </testcasegroups>
	    <testunitgroups>
	      <group name="*"/>
	    </testunitgroups>
	  </suite>
	</configuration>

..

<configuration version="1">
###########################

* ``<configuration></configuration>`` is a root tag which is responsible to hold multiple ``<suite>`` and its child tags.
* ``version`` attributes is used to identify test script version.

<suite>
#######

* ``<suite></suite>`` represents one test suite.
* Test script may have multiple ``<suite></suite>`` elements.
* All specified test suites runs in parallel upon test script execution.

</suite> attributes:
====================

	**loopcount**

		* Loop count specifies number of time test suite execution will be repeated. 
		* Loop count value "1" will be used in case of missing or invalid argument is provided. 

	**name**

		* String value which is used in construction of log file name. 
		* Value longer than 10 characters will be trimmed to 10 characters.
		* Allowed character sets are [A-Z][a-z][0-9][-]
		* User should choose unique name per test suite so log files can be identified using identifier.

<tests>
#######

* ``<tests></tests>`` contains list of test cases. test cases can be specified using their fully qualified path name. Test case names are case sensitive.
* Test cases will be executed in same sequence as specified in the script.
* Test cases are listed in the script but marked with attribute ``TestCase(skip=true)`` will be omitted from execution list.
* Test cases are listed in the script but outside Runner's scan scope will be omitted from execution list.
* If ``<tests></tests>`` is empty then all test cases within Runner's scan scope are executed following sequence specified using ``TestCase(sequence=1)`` attribute.
* Remaining test cases will be further filtered using group filter which will be explained under ``<testcasegroups>`` tag description.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Sample <tests> element

	<tests>
		<test name="com.test.feature1.TestCase_1"/>
		<test name="com.test.feature1.TestCase_2"/>

		<test name="com.test.feature2.TestCase_1"/>
		<test name="com.test.feature2.TestCase_2"/>
	</tests>

..

<parameters>
############

Provides a way to specify test suite specific information which is accessible at run time. (for example: product serial number, ip address, file paths etc..)

* ``<parameters></parameters>`` contains list of parameters and their string value. Parameter name and value are case sensitive.
* All listed parameters value can be requested at run time using method ``context.getGlobalObject(key);``.
* All listed parameters value can be updated at run time using method ``context.setGlobalObject(key, obj);``.
* Each test suite parameters are maintained separately so they can be updated or removed without conflict.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Sample <parameters> element

	<parameters>
	    <parameter name="SerialNumber">ABC_0567</parameter>
	    <parameter name="DownloadPath">/usr/temp/download</parameter>
	    <parameter name="Product_IP">192.168.1.101</parameter>
	</parameters>

..

<testcasegroups>
################

* ``<testcasegroups></testcasegroups>`` contains list of group names or regular expression. Group names are case in-sensitive.
* Test cases short listed following steps described in ``<tests>`` are further filtered using group names listed in ``<testcasegroups>`` tag. Test cases do not belong to any of the listed group are omitted from execution list. 
* Filter will not be applied in case of missing ``<testcasegroups>`` tag.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: All listed test cases will be added to execution list

	<testcasegroups>
	    <group name="*"/>
	</testcasegroups>

..

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Test case belongs to "Automated" OR "Semi-Automated" test cases will be added to execution list

	<testcasegroups>
	    <group name="Automated"/>
	    <group name="Semi-Automated"/>
	</testcasegroups>

..

<testunitgroups>
################

* ``<testunitgroups></testunitgroups>`` contains list of group names or regular expression. Group names are case in-sensitive.
* Unit group filter is only applied to test cases that are short listed after applying ``<testcasegroups>`` group filter. 
* Filter will not be applied in case of missing ``<testunitgroups>`` tag.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: All test units will be added to execution list

	<testunitgroups>
	    <group name="*"/>
	</testunitgroups>

..

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Test units belongs to "Fast" OR "Slow" test units will be added to execution list

	<testunitgroups>
	    <group name="Fast"/>
	    <group name="Slow"/>
	</testunitgroups>

..

Auto Generate test script
#########################

Test script is generated manually or auto generated using ARTOS inbuilt feature. 

* To enable auto generation feature

	* Change ``generateTestScript`` property within ``conf/framework_configuration.xml`` file to **true**.

	>>> <property name="generateTestScript">true</property>

* Once enabled

	* Run ARTOS using Runner class via IDE
	* Test script will be auto generated inside ``script`` directory.