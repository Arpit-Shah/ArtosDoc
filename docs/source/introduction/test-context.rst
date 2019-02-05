Test Context
************

* Test context is a container that holds live information about test suite, test cases and related information.
* Test context provides many useful methods to make test case development easy.
* Each test suite maintains its own ``TestContext`` object instance that allows parallel test suite execution without any conflict.
* All annotated methods are injected with relevant ``TestContext`` object so test suite related information is available to each test case/unit all the time.

Logger
######

User can get relevant logger object and log to appropriate log files using one of the following methods. 

>>> Logs to log file with set log level
context.getLogger().info();
context.getLogger().debug();
context.getLogger().warn();
context.getLogger().error();
context.getLogger().fatal();
context.getLogger().trace();

DataProvider Parameters
#######################

DataProvider method returns 2D array. ARTOS repeats test case execution as many time as the length of 2D array. ARTOS updates relevant TestContext variables with next values each execution. Test units can access those values using following methods. 

>>> Gets DataProvider parameter value
context.getParameterisedObject1();
context.getParameterisedObject2();

Global object storage
#####################

ARTOS TestContext can store key value pairs. Any method with an access of TestContext can retrieve, update or remove set value pairs. User can use one of the following methods to achieve that.

>>> Sets key value pair
context.setGlobalObject(String key, Object obj); 
context.setGlobalString(String key, String obj); 

>>> Gets key value
context.setGlobalObject(String key); 
context.getGlobalString(String key);

Live TestCase Count
###################

User can query number of test cases by their outcome using following methods.

>>> Gets TestCase count at that point of time
context.getCurrentFailCount();
context.getCurrentKTFCount();
context.getCurrentPassCount();
context.getCurrentSkipCount();