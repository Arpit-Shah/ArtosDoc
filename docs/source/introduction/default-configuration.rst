Generate Default Configurations
*******************************

The ARTOS' first launch generates required configurations and directories in ``conf`` directory under project root. If configuration file is already present then it will not be overwritten but all missing files are re-created with default values.

.. image:: Default_Configuration.png

.. csv-table:: 
	:header: Configuration Name, Description
	:widths: 30, 70
	:stub-columns: 0
	
	"conf/extent_configuration.xml", "configuration for extend reports"
	"conf/framework_configuration.xml", "configuration for ARTOS framework"
	"conf/framework_configuration.xsd", "XML schema definition for framework_configuration.xml"

..