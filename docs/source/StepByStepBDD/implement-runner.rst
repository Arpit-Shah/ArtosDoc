Implement Runner
****************

A runner is a Java class which meets the following requirements:

* Class is ``public`` and implements ``main()`` method.
* The ``main()`` method invokes Artos' runner object as shown in below example.

Steps

* Create a Java class under required package structure 
* Implement ``main()`` method and Runner code as shown in the example below.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Test Runner code
	
	package com.tests;

	import com.artos.framework.infra.Runner;

	public class ArtosMain {
		public static void main(String[] args) throws Exception {
			Runner runner = new Runner(ArtosMain.class);
			List<String> featureFileNameList = new ArrayList<String>();
			featureFileNameList.add("feature1_test.feature");
			runner.setFeatureFileList(featureFileNameList);
			runner.run(args);
		}
	}
..