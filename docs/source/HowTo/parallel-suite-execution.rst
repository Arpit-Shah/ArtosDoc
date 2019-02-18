Parallel Suite Execution
************************

* All test suites specified in test script will run in parallel upon test application launch. Test suites can have same or different test cases. User can specify different  parameters per test suite which will be available during run time. 
* Parallel suite execution feature can be used in following scenarios:

	*  Test multiple product at the same time.
	*  Test one product by splitting test cases into multiple test suites.

Sample script is given below which targets two different products based on specified IP address.  

.. code-block:: xml
	:linenos:
	:emphasize-lines: 12, 30
	:caption: Sample test script

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<configuration version="1">

	  <suite loopcount="1" name="TestSuite1">
	    <tests>
	      <test name="com.featureXYZ.TestCase_1"/>
	      <test name="com.featureXYZ.TestCase_2"/>
	    </tests>
	    <parameters>
	      <parameter name="SerialNumber">ABC_0123</parameter>
	      <parameter name="DownloadPath">/usr/temp/download</parameter>
	      <parameter name="Product_IP">192.168.1.100</parameter>
	    </parameters>
	    <testcasegroups>
	      <group name="*"/>
	    </testcasegroups>
	    <testunitgroups>
	      <group name="*"/>
	    </testunitgroups>
	  </suite>

	  <suite loopcount="1" name="TestSuite2">
	    <tests>
	      <test name="com.featureXYZ.TestCase_1"/>
	      <test name="com.featureXYZ.TestCase_2"/>
	    </tests>
	    <parameters>
	      <parameter name="SerialNumber">ABC_0567</parameter>
	      <parameter name="DownloadPath">/usr/temp/download</parameter>
	      <parameter name="Product_IP">192.168.1.101</parameter>
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