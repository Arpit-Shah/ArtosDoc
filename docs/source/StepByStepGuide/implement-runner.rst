Implement Runner
****************

A runner is a Java class which meets the following requirements:

* Class is ``public`` and implements ``main()`` method.
* The ``main()`` method invokes ARTOS runner object as shown in below example.

Steps

* Create a Java class under required package structure (In this example : com.tests.ArtosMain.java).
* Implement ``main`` method and Runner code as shown in the example below.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Test Runner code
	
	package com.tests;

	import com.artos.framework.infra.Runner;

	public class ArtosMain {
		public static void main(String[] args) throws Exception {
			Runner runner = new Runner(ArtosMain.class);
			runner.run(args);
		}
	}
..