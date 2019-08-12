Test Context
************

A ``TestContext`` is globally available Java container object and used to hold information relating to test case(s) through out test suite life cycle. During parallel testing each thread  

.. csv-table:: 
	:header: Command, Usage
	:widths: 55, 45
	:stub-columns: 0

	"context.setTestStatus(testStatus, description);", 	"Update test status with description"
	"context.getLogger();",								"Get logger object"
	"context.getLogger().info();", 						"To log information level string"
	"context.getLogger().debug();", 					"To log debug level string"
	"context.getLogger().warn();", 						"To log warning level string"
	"context.getLogger().error();", 					"To log error level string"
	"context.getLogger().fatal();", 					"To log fatal level string"
	"context.getLogger().trace();", 					"To log trace level string"
	"context.getLogger().disableGeneralLog();", 		"Temporary disable logging"
	"context.getLogger().enableGeneralLog();", 			"Enable logging"
	"context.getLogger().getCurrentGeneralLogFiles();", "Get list of test suite relevant log files"
	"context.getLogger().getCurrentRealTimeLogFiles();", "Get list of test suite relevant real time log files"
	"context.getLogger().getCurrentSummaryLogFiles();", "Get list of test suite relevant summary report"
	"context.getParameterisedObject1();", 				"Get 2D DataProvider object 1"
	"context.getParameterisedObject2();", 				"Get 2D DataProvider object 2"
	"context.getDataProviderMap();", 					"Get Map containing all available DataProviders"
	"context.printMethodName();", 						"Prints executing method name"
	"context.setGlobalObject(String key, Object obj);",	"Store any object with key"
	"context.setGlobalString(String key, String obj);", "Store string object with key"
	"context.setGlobalObject(String key);", 			"Get any object using key"
	"context.getGlobalString(String key);", 			"Get string object using key"
	"context.getCurrentFailCount();", 					"Get total fail count at point of time"
	"context.getCurrentKTFCount();", 					"Get total fail count at point of time"
	"context.getCurrentPassCount();", 					"Get total fail count at point of time"
	"context.getCurrentSkipCount();", 					"Get total fail count at point of time"
	"context.registerListener(listener);", 				"Register new listener to provide test live update"
	"context.deRegisterListener(listener);", 			"Remove registered listener"
	"context.isKnownToFail();", 						"Returns test case known to fail flag"
	"context.getCurrentTestStatus();", 					"Returns current test status"
	"context.getCurrentTestUnitStatus();", 				"Returns current test unit status"

..

Context example
###############

.. code-block:: Java
	:linenos:
	:emphasize-lines: 14, 21
	:caption: : Example highlights that each test unit is passed with TestContext argument, so each test unit has access to relevant context object in run time

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "GIVEN..WHEN..AND..THEN..")
	@TestCase()
	public class TestCase_1 implements TestExecutable {

		@Unit()
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------
			// TODO write logic here
			// --------------------------------------------------------
		}

		@Unit()
		public void unit_test2(TestContext context) throws Exception {
			// --------------------------------------------------------
			// TODO write logic here
			// --------------------------------------------------------
		}
	}

..