Implement Runner
****************

A runner is the entry point to a test application. A project can have one or more test runners. Test cases inside runner's scan scope can be included in the test suite. A runner is a Java class which meets the following requirements:

* Class contains ``main`` method.
* The ``main`` method invokes ``run`` method from the ARTOS' ``Runner()`` class object.

Steps

* Create a Java class under required package structure (In this example : com.tests.ArtosMain.java).
* Implement ``main`` method and Runner code as shown in the example below.

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