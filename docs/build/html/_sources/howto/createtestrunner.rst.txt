Create a Runner
***************

Runner is a Java class which meets following requirements

* Class contains main() method.
* Class invokes run method from ARTOS' Runner object.

Steps

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