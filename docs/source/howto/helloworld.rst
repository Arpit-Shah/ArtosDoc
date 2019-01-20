.. _Artos_Maven_Repository: https://mvnrepository.com/artifact/com.theartos/artos/

Hello World
***********

Artos is ready to execute test cases in three simple steps

* Add Artos Jar as a dependency
* Create a Runner
* Create a TestCase

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

Create a Runner
###############

* Create required package structure (In this example : com.tests).
* Create new Java class inside created package structure (In this example : ArtosMain.java).
* Copy paste below code in newly created Java file.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0
	
	package com.tests;

	import com.artos.framework.infra.Runner;

	public class ArtosMain {
		public static void main(String[] args) throws Exception {
			Runner runner = new Runner(ArtosMain.class);
			runner.run(args, null, 1);
		}
	}

..

Create a TestCase
#################

* Create new Java class inside created package structure (In this example : TestCase_1.java)
* Copy paste below code in newly created Java file.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	package com.tests;

	import com.artos.annotation.TestCase;
	import com.artos.annotation.TestPlan;
	import com.artos.annotation.Unit;
	import com.artos.framework.infra.TestContext;
	import com.artos.interfaces.TestExecutable;

	@TestPlan(preparedBy = "ArpitS", preparationDate = "1/1/2018", bdd = "given project has no errors then hello world will be printed")
	@TestCase(skip = false, sequence = 0)
	public class TestCase_1 implements TestExecutable {

		@Unit(skip = false, sequence = 1)
		public void unit_test1(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print on console
			System.out.println("Hello World 1");
			// Print inside a log file
			context.getLogger().debug("Hello World 1");
			// --------------------------------------------------------------------------------------------
		}

		@Unit(skip = false, sequence = 2)
		public void unit_test2(TestContext context) throws Exception {
			// --------------------------------------------------------------------------------------------
			// Print on console
			System.out.println("Hello World 2");
			// Print inside a log file
			context.getLogger().debug("Hello World 2");
			// --------------------------------------------------------------------------------------------
		}
	}

..

* Invoke main() method by running project as Java application.
* You have successfully executed your first test case using ARTOS.