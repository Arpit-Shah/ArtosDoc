Command line Parameters
***********************

ARTOS support short and long convention of command line parameters. Supported commands are listed below.

.. csv-table:: 
	:header: Short, Long, Description
	:widths: 15, 15, 70
	:stub-columns: 0
	
	-c,--contributors, Prints ARTOS contributors name
	-h,--help, Command line help
	-p <arg>,--profile <arg>, Framework configuration profile name
	-ts <arg>,--testscript <arg>, Test script file path
	-v,--version, ARTOS' version

..

* Test script and profile can be specified via command line using following example:

>>> Short convention 
java -cp .\lib\artos-0.0.1.jar .\lib\testproject.jar TestRunner -ts=".\script\testscript.xml" --p="dev"
>>> Long convention
java -cp .\lib\artos-0.0.1.jar .\lib\testproject.jar TestRunner --testscript=".\script\testscript.xml" --profile="dev"
         
                 
                          

        
    
                          

              