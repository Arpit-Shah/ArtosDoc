.. _reportportal-client: https://mvnrepository.com/artifact/com.theartos/reportportal-client

Report Portal Integration with Artos
************************************

.. admonition:: Note
    
    Based on this example you can create your own integration with a Artos test framework. We can provide a support for integration with a new framework or supporting exsisting one. If you need more details, please email on artos.framework@gmail.com

..

.. admonition:: Recommended
    
    * This example is recommended to be used with Artos build 0.0.14 or above

..

Preparation
###########

* Go to reportportal-client_
* Download latest jar or copy Maven dependency signature for Maven project.
* Add jar to test project build path. If maven test project then add Maven dependency to POM file. 

.. code-block:: xml
   :linenos: 
   :emphasize-lines: 0

	<!-- https://mvnrepository.com/artifact/com.theartos/reportportal-client -->
	<dependency>
		<groupId>com.theartos</groupId>
		<artifactId>reportportal-client</artifactId>
		<version>0.0.1</version>
	</dependency>

..

* Re-build the Maven project to ensure all required dependency are downloaded to local repository. 
* Create **conf** directory to project root (./conf) if not already present.
* Create **reportportal_configuration.xml** file inside conf directory (./conf/reportportal_configuration.xml).
* Add following details to **reportportal_configuration.xml** file.


.. code-block:: xml
   :linenos: 
   :emphasize-lines: 0

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<configuration>
	  <reportportal_info>
		<property name="TestSuite_Name">TEST_SUITE_1</property>
		<property name="Project_Name">RPT_PRJ_1</property>
		<property name="Release_Name">01.02.0002</property>
		<property name="Base_URL">http://192.168.1.26:8080</property>
		<property name="UUID">0acb493c-37d2-4afc-a029-3c7aad01fb78</property>
	  </reportportal_info>
	</configuration>

..

* Update xml values to match your local reportportal configuration. 
* Save and close the file. 

Create Listener for Artos
#########################

* Create **ReportPortalListener.java** class inside test project.
* Copy and paste below code to your local project
* Fix package location as per your project

.. code-block:: Java
   :linenos: 
   :emphasize-lines: 0

	/*******************************************************************************
	 * Copyright (C) 2018-2020 Arpit Shah and Artos Contributors
	 * 
	 * Permission is hereby granted, free of charge, to any person obtaining a copy
	 * of this software and associated documentation files (the "Software"), to deal
	 * in the Software without restriction, including without limitation the rights
	 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	 * copies of the Software, and to permit persons to whom the Software is
	 * furnished to do so, subject to the following conditions:
	 * 
	 * The above copyright notice and this permission notice shall be included in
	 * all copies or substantial portions of the Software.
	 * 
	 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	 * SOFTWARE.
	******************************************************************************/
	package listener;

	import java.io.File;
	import java.util.ArrayList;
	import java.util.HashSet;
	import java.util.LinkedHashMap;
	import java.util.List;
	import java.util.Map;
	import java.util.Set;

	import com.artos.framework.Enums.TestStatus;
	import com.artos.framework.infra.BDDScenario;
	import com.artos.framework.infra.BDDStep;
	import com.artos.framework.infra.TestObjectWrapper;
	import com.artos.framework.infra.TestUnitObjectWrapper;
	import com.artos.interfaces.TestProgress;
	import com.google.common.base.Throwables;
	import com.theartos.ReportPortalLauncher;
	import com.theartos.ReportPortalLauncher.LogStatus;
	import com.theartos.ReportPortalLauncher.Status;

	public class ReportPortalListener implements TestProgress {

		ReportPortalLauncher rpl;
		boolean activeTest = false;
		boolean activeChildUnit = false;
		boolean debug = false;

		// **************************************************************
		// Common functionality between BDD or Non-BDD testcase/testunits
		// **************************************************************

		@Override
		public void testSuiteExecutionStarted(String description) {

			if (debug) {
				System.err.println("testSuiteExecutionStarted(String description)");
			}

			rpl = new ReportPortalLauncher();
			rpl.StartLaunch();

			String TestSuiteName = "TestSuite"; // Default value

			// Find Test Suite Name
			if (null != description) {
				String[] desc = description.split("\\.");
				int descLength = desc.length;
				if (descLength > 2) {
					TestSuiteName = desc[descLength - 2];
				} else {
					TestSuiteName = description;
				}
			}

			rpl.StartSuite("TestSuite: " + TestSuiteName, description);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void testSuiteExecutionFinished(String description) {

			if (debug) {
				System.err.println("testSuiteExecutionFinished(String description)");
			}

			rpl.endSuite();
			rpl.endLaunch();

			// Give some time for API to finish its communication
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void testException(Throwable e) {
			rpl.log(LogStatus.Error, Throwables.getStackTraceAsString(e));
		}

		@Override
		public void unitException(Throwable e) {
			rpl.log(LogStatus.Error, Throwables.getStackTraceAsString(e));
		}

		@Override
		public void testCaseSummaryPrinting(String FQCN, String description) {
			if (debug) {
				System.err.println("testCaseSummaryPrinting(String FQCN, String description)");
			}
		}

		@Override
		public void testUnitSummaryPrinting(String FQCN, String description) {
			if (debug) {
				System.err.println("testUnitSummaryPrinting(String FQCN, String description)");
			}
		}

		@Override
		public void testSuiteSummaryPrinting(String description) {
			if (debug) {
				System.err.println("testSuiteSummaryPrinting(String description)");
			}
		}

		@Override
		public void testExecutionLoopCount(int count) {
			// TODO Auto-generated method stub

		}

		@Override
		public void testCaseExecutionSkipped(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void testCaseExecutionFinished(TestObjectWrapper t) {

		}

		@Override
		public void testSuiteFailureHighlight(String description) {
			// TODO Auto-generated method stub

		}

		@Override
		public void testSuiteException(Throwable e) {
			// TODO Auto-generated method stub

		}

		// ********************************************************
		// Non-BDD Test Cases
		// ********************************************************
		@Override
		public void testCaseExecutionStarted(TestObjectWrapper t) {

			if (debug) {
				System.err.println("testCaseExecutionStarted(TestObjectWrapper t)");
			}

			Set<String> tags = new HashSet<String>();
			for (String s : t.getGroupList()) {
				tags.add(s);
			}
			// Start next test
			rpl.StartTest(t.getTestClassObject().getName(),
					"".equals(t.getTestPlanDescription().trim()) ? t.getTestPlanBDD() : t.getTestPlanDescription(), tags);
			activeTest = true;
		}

		@Override
		public void testResult(TestObjectWrapper t, TestStatus testStatus, File snapshot, String description) {

			if (debug) {
				System.err.println(
						"testResult(TestObjectWrapper t, TestStatus testStatus, File snapshot, String description)");
			}

			if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
				rpl.endTest(Status.PASSED);
			} else if (testStatus == TestStatus.SKIP) {
				rpl.endTest(Status.SKIPPED);
			} else if (testStatus == TestStatus.FAIL) {
				rpl.endTest(Status.FAILED);
			}
		}

		@Override
		public void childTestUnitExecutionStarted(TestObjectWrapper t, TestUnitObjectWrapper unit, String paramInfo) {

			if (debug) {
				System.err.println(
						"childTestUnitExecutionStarted(TestObjectWrapper t, TestUnitObjectWrapper unit, String paramInfo)");
			}

			Set<String> tags = new HashSet<String>();
			for (String s : unit.getGroupList()) {
				tags.add(s);
			}
			rpl.StartStep(unit.getTestUnitMethod().getName() + " " + paramInfo,
					"".equals(unit.getTestPlanDescription()) ? unit.getTestPlanBDD() : unit.getTestPlanDescription(), tags);
			activeChildUnit = true;
		}

		@Override
		public void testUnitExecutionStarted(TestUnitObjectWrapper unit) {

			if (debug) {
				System.err.println("testUnitExecutionStarted(TestUnitObjectWrapper unit)");
			}

			if (!activeChildUnit) {
				Set<String> tags = new HashSet<String>();
				for (String s : unit.getGroupList()) {
					tags.add(s);
				}
				rpl.StartStep(unit.getTestUnitMethod().getName(),
						"".equals(unit.getTestPlanDescription().trim()) ? unit.getTestPlanBDD()
								: unit.getTestPlanDescription(),
						tags);
			}
		}

		@Override
		public void testUnitResult(TestUnitObjectWrapper unit, TestStatus testStatus, File snapshot, String description) {

			if (debug) {
				System.err.println(
						"testUnitResult(TestUnitObjectWrapper unit, TestStatus testStatus, File snapshot, String description)");
			}

			if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
				rpl.endStep(Status.PASSED);
			} else if (testStatus == TestStatus.SKIP) {
				rpl.endStep(Status.SKIPPED);
			} else if (testStatus == TestStatus.FAIL) {
				rpl.endStep(Status.FAILED);
			}
			activeChildUnit = false;
		}

		@Override
		public void testCaseStatusUpdate(TestStatus testStatus, File snapshot, String msg) {

			if (debug) {
				System.err.println("testCaseStatusUpdate(TestStatus testStatus, File snapshot, String msg)");
			}

			if (snapshot == null) {
				rpl.log(LogStatus.Info, msg);
			} else {
				rpl.log(LogStatus.Info, msg, snapshot);
			}
		}

		@Override
		public void childTestUnitExecutionFinished(TestUnitObjectWrapper unit) {
			if (debug) {
				System.err.println("childTestUnitExecutionFinished(TestUnitObjectWrapper unit)");
			}
		}

		@Override
		public void testUnitExecutionFinished(TestUnitObjectWrapper unit) {
			if (debug) {
				System.err.println("testUnitExecutionFinished(TestUnitObjectWrapper unit)");
			}
		}

		@Override
		public void childTestCaseExecutionStarted(TestObjectWrapper t, String paramInfo) {
			if (debug) {
				System.err.println("childTestCaseExecutionStarted(TestObjectWrapper t, String paramInfo)");
			}
		}

		@Override
		public void childTestCaseExecutionFinished(TestObjectWrapper t) {
			if (debug) {
				System.err.println("childTestCaseExecutionFinished(TestObjectWrapper t)");
			}

		}

		@Override
		public void printTestPlan(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void printTestUnitPlan(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		// ********************************************************
		// BDD Test Cases
		// ********************************************************

		@Override
		public void testCaseExecutionStarted(BDDScenario scenario) {

			if (debug) {
				System.err.println("testCaseExecutionStarted(BDDScenario scenario)");
			}

			Set<String> tags = new HashSet<String>();
			for (String s : scenario.getGroupList()) {
				tags.add(s);
			}

			StringBuilder sb = new StringBuilder();
			LinkedHashMap<String, List<String>> globalDatatable = scenario.getGlobalDataTable();
			List<String> keyList = new ArrayList<String>();
			int numberOfDataRaw = 0;
			for (Map.Entry<String, List<String>> entry : globalDatatable.entrySet()) {
				keyList.add(entry.getKey());
				numberOfDataRaw = entry.getValue().size();
			}

			for (int j = 0; j < keyList.size(); j++) {
				sb.append("|");
				sb.append(keyList.get(j));
			}
			sb.append("|\n");

			for (int i = 0; i < numberOfDataRaw; i++) {
				for (int j = 0; j < keyList.size(); j++) {
					sb.append("|");
					sb.append(globalDatatable.get(keyList.get(j)).get(i));
				}
				sb.append("|\n");
			}

			// Start next test
			rpl.StartTest("Scenario: " + scenario.getScenarioDescription(), sb.toString().equals("|") ? "" : sb.toString(),
					tags);
			activeTest = true;
		}

		@Override
		public void testResult(BDDScenario scenario, TestStatus testStatus, File snapshot, String description) {

			if (debug) {
				System.err.println(
						"testResult(BDDScenario scenario, TestStatus testStatus, File snapshot, String description)");
			}

			if (!activeChildUnit) {
				if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
					rpl.endTest(Status.PASSED);
				} else if (testStatus == TestStatus.SKIP) {
					rpl.endTest(Status.SKIPPED);
				} else if (testStatus == TestStatus.FAIL) {
					rpl.endTest(Status.FAILED);
				}

				activeTest = false;
			} else {

				// First close child test
				if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
					rpl.endStep(Status.PASSED);
				} else if (testStatus == TestStatus.SKIP) {
					rpl.endStep(Status.SKIPPED);
				} else if (testStatus == TestStatus.FAIL) {
					rpl.endStep(Status.FAILED);
				}

				activeChildUnit = false;
			}
		}

		@Override
		public void childTestUnitExecutionStarted(BDDScenario scenario, BDDStep step, String paramInfo) {

			if (debug) {
				System.err.println("childTestUnitExecutionStarted(BDDScenario scenario, BDDStep step, String paramInfo)");
			}
		}

		@Override
		public void testUnitExecutionStarted(BDDStep step) {

			if (debug) {
				System.err.println("testUnitExecutionStarted(BDDStep step)");
			}

			if (!activeChildUnit) {
				rpl.StartStep("Step: " + step.getStepDescription(), step.getStepDescription(), null);
			} else {
				rpl.StartChildStep("Parameterized Step: " + step.getStepDescription(), step.getStepDescription(), null);
			}
		}

		@Override
		public void childTestCaseExecutionStarted(BDDScenario scenario, String paramInfo) {
			if (debug) {
				System.err.println("childTestCaseExecutionStarted(BDDScenario scenario, String paramInfo)");
			}

			Set<String> tags = new HashSet<String>();
			for (String s : scenario.getGroupList()) {
				tags.add(s);
			}

			StringBuilder sb = new StringBuilder();
			LinkedHashMap<String, List<String>> globalDatatable = scenario.getGlobalDataTable();
			List<String> keyList = new ArrayList<String>();

			for (Map.Entry<String, List<String>> entry : globalDatatable.entrySet()) {
				keyList.add(entry.getKey());
			}

			for (int j = 0; j < keyList.size(); j++) {
				sb.append("|");
				sb.append(keyList.get(j));
			}
			sb.append("|\n");

			int indexNumber = Integer.parseInt(paramInfo.substring(paramInfo.indexOf("(") + 1, paramInfo.indexOf(")")));
			for (int j = 0; j < keyList.size(); j++) {
				sb.append("|");
				sb.append(globalDatatable.get(keyList.get(j)).get(indexNumber));
			}
			sb.append("|\n");

			rpl.StartStep("Step: " + scenario.getScenarioDescription() + " " + paramInfo, sb.toString(), tags);
			activeChildUnit = true;
		}

		@Override
		public void childTestCaseExecutionFinished(BDDScenario scenario) {
			if (debug) {
				System.err.println("childTestCaseExecutionFinished(BDDScenario scenario)");
			}

		}

		@Override
		public void childTestUnitExecutionFinished(BDDStep step) {
			if (debug) {
				System.err.println("childTestUnitExecutionFinished(BDDStep step)");
			}

		}

		@Override
		public void testCaseExecutionFinished(BDDScenario scenario) {
			if (debug) {
				System.err.println("testCaseExecutionFinished(BDDScenario scenario)");
			}

			if (activeTest) {
				// Then close the testcase
				rpl.endTest(Status.PASSED);
				activeTest = false;
			}

		}

		@Override
		public void testUnitResult(BDDStep step, TestStatus testStatus, File snapshot, String description) {
			if (debug) {
				System.err.println("testUnitExecutionFinished(BDDStep step)");
			}

			if (!activeChildUnit) {
				// First close child test
				if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
					rpl.endStep(Status.PASSED);
				} else if (testStatus == TestStatus.SKIP) {
					rpl.endStep(Status.SKIPPED);
				} else if (testStatus == TestStatus.FAIL) {
					rpl.endStep(Status.FAILED);
				}
			} else {
				// First close child test
				if (testStatus == TestStatus.PASS || testStatus == TestStatus.KTF) {
					rpl.endChildStep(Status.PASSED);
				} else if (testStatus == TestStatus.SKIP) {
					rpl.endChildStep(Status.SKIPPED);
				} else if (testStatus == TestStatus.FAIL) {
					rpl.endChildStep(Status.FAILED);
				}
			}
		}

		@Override
		public void testUnitExecutionFinished(BDDStep step) {
			// TODO Auto-generated method stub
		}

		@Override
		public void printTestPlan(BDDScenario sc) {
			// TODO Auto-generated method stub

		}

		@Override
		public void printTestUnitPlan(BDDStep step) {
			// TODO Auto-generated method stub

		}

		// ********************************************************
		// Before After
		// ********************************************************

		@Override
		public void beforeTestSuiteMethodExecutionStarted(String methodName, String description) {
			// TODO Auto-generated method stub

		}

		@Override
		public void beforeTestSuiteMethodExecutionFinished(String description) {
			// TODO Auto-generated method stub

		}

		@Override
		public void afterTestSuiteMethodExecutionStarted(String methodName, String description) {
			// TODO Auto-generated method stub

		}

		@Override
		public void afterTestSuiteMethodExecutionFinished(String description) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestUnitMethodExecutionStarted(String methodName, TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestUnitMethodExecutionStarted(String methodName, BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestUnitMethodExecutionFinished(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestUnitMethodExecutionFinished(BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestUnitMethodExecutionStarted(String methodName, TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestUnitMethodExecutionStarted(String methodName, BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterFailedUnitMethodExecutionStarted(String methodName, TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterFailedUnitMethodExecutionStarted(String methodName, BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestUnitMethodExecutionFinished(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestUnitMethodExecutionFinished(BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterFailedUnitMethodExecutionFinished(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterFailedUnitMethodExecutionFinished(BDDStep step) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localBeforeTestUnitMethodExecutionStarted(TestObjectWrapper t, TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localBeforeTestUnitMethodExecutionFinished(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localAfterTestUnitMethodExecutionStarted(TestObjectWrapper t, TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localAfterTestUnitMethodExecutionFinished(TestUnitObjectWrapper unit) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestCaseMethodExecutionStarted(String methodName, TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestCaseMethodExecutionStarted(String methodName, BDDScenario scenario) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestCaseMethodExecutionFinished(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalBeforeTestCaseMethodExecutionFinished(BDDScenario scenario) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestCaseMethodExecutionStarted(String methodName, TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestCaseMethodExecutionStarted(String methodName, BDDScenario scenario) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestCaseMethodExecutionFinished(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void globalAfterTestCaseMethodExecutionFinished(BDDScenario scenario) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localBeforeTestCaseMethodExecutionStarted(String methodName, TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localBeforeTestCaseMethodExecutionFinished(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localAfterTestCaseMethodExecutionStarted(String methodName, TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

		@Override
		public void localAfterTestCaseMethodExecutionFinished(TestObjectWrapper t) {
			// TODO Auto-generated method stub

		}

	}


..

Register listener to the Artos runner
#####################################

* Change Artos runner launch code as shown below to register listener.

.. code-block:: Java
   :linenos: 
   :emphasize-lines: 0

	public static void main(String[] args) throws Exception {
		List<Class<?>> listeners = new ArrayList<Class<?>>();
		listeners.add(ReportPortalListener.class);
		Runner runner = new Runner(FeatureRunner.class, listeners);
		runner.setTestList(getTestList());
		runner.run(args);
	}

..

* Execute runner. 
* You should see new Launch is created in Report Portal instance.


