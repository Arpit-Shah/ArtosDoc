Framework Configuration
***********************

The ``framework_configuration.xml`` is used to configure the Artos behavior. File should be located/generated at ``./conf`` directory of the project. ARTOS generates default configuration file if the file is not present.

.. code-block:: xml
	:linenos:
	:emphasize-lines: 0
	:caption: Default configuration file

		<?xml version="1.0" encoding="UTF-8" standalone="no"?>
		<configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="framework_configuration.xsd">
		 <organization_info profile="dev">
	       	<property name="Name">&lt;Organisation&gt; PTY LTD</property>
	       	<property name="Address">XX, Test Street, Test address</property>
	       	<property name="Country">NewZealand</property>
	       	<property name="Contact_Number">+64 1234567</property>
	       	<property name="Email">artos.framework@gmail.com</property>
	       	<property name="Website">www.theartos.com</property>
	     </organization_info>
	     <logger profile="dev">
	       	<!--LogLevel Options : info:debug:trace:fatal:warn:all -->
	       	<property name="logLevel">debug</property>
	       	<property name="logRootDir">.\reporting\</property>
	       	<property name="enableLogDecoration">true</property>
	       	<property name="enableTextLog">true</property>
	       	<property name="enableHTMLLog">false</property>
	       	<property name="enableRealTimeLog">false</property>
	       	<property name="enableExtentReport">true</property>
	       	<property name="enableJUnitReport">true</property>
	       	<property name="enableLogCleanup">true</property>
	     </logger>
	     <smtp_settings profile="dev">
	       	<property name="ServerAddress">smtp.gmail.com</property>
	       	<property name="SSLPort">587</property>
	       	<property name="SMTPAuth">true</property>
	       	<property name="SendersName">John Murray</property>
	       	<property name="SendersEmail">test@gmail.com</property>
	       	<property name="emailAuthSettingsFilePath">.\conf\user_auth_settings.xml</property>
	       	<property name="ReceiversEmail">test@gmail.com</property>
	       	<property name="ReceiversName">Mac Murray</property>
	       	<property name="EmailSubject">Artos Email Client</property>
	       	<property name="EmailMessage">This is a test Email from Artos</property>
	     </smtp_settings>
	     <dashboard profile="dev">
	       	<!--Default : 127.0.0.1 -->
	       	<property name="dashBoardRemoteIP">127.0.0.1</property>
	       	<property name="dashBoardRemotePort">11111</property>
	     </dashboard>
	     <features profile="dev">
	       	<property name="enableGUITestSelector">true</property>
	       	<property name="enableGUITestSelectorSeqNumber">true</property>
	       	<property name="enableBanner">true</property>
	       	<property name="enableOrganisationInfo">true</property>
	       	<property name="enableEmailClient">false</property>
	       	<property name="enableArtosDebug">false</property>
	       	<property name="generateEclipseTemplate">true</property>
	       	<property name="generateIntelliJTemplate">false</property>
	       	<property name="generateTestScript">true</property>
	       	<property name="stopOnFail">false</property>
	       	<property name="enableDashBoard">false</property>
	     </features>
		</configuration>
   
..

Each XML block lets user control specific functionalities of the framework. Default configuration's are applied if user has missing block or invalid profile is specified. ``profile="dev"`` indicates development profile. Development profile is used by default unless specific profile is set by user at launch time. User can hardcode profile name in their runner or specify profile name via command line parameter at launch time. Profile lets user apply different conigurations between development or production environments. There are not any limitations on how many profile user can create and they all can be listed in same file. 
 
<organization_info>
###################

The ``<organization_info>`` tag provides a way to specify organization information which will be printed at the start of each log files and on a console. This does not apply to rolled over log files. Printing of organization information can be enabled or disabled by setting property under the ``<feature>`` tag as shown below.

.. code-block:: xml
    :linenos:
    :emphasize-lines: 0

	<property name="enableOrganisationInfo">true</property>

..

Attribute

.. csv-table:: 
	:header: Name, Description
	:widths: 20, 80
	:stub-columns: 0
		
	profile, profile name

..

Properties

.. csv-table:: 
	:header: Property Name, Content, Description
	:widths: 30, 20, 50
	:stub-columns: 0
			
	Name 			    , String, Organization name
	Address 		    , String, Organization address
	Country 		    , String, Country name
	Contact_Number  , String, Organization contact number
	Email 			 , String, Organization email address
	Website 		    , String, Organization Website
	
..

<logger>
########

The ``<logger>`` tag provides a way to configure the log framework and the report behavior.

Attribute

.. csv-table:: 
	:header: Name, Description
	:widths: 20, 80
	:stub-columns: 0
		
	profile, profile name

..

Properties

.. csv-table:: 
	:header: Property Name, Content, Description
	:widths: 30, 30, 40
	:stub-columns: 0
			
	logLevel 			  , String 	   , Set log level
	logRootDir 			  , String 	   , Set log root directory relative to project
	enableLogDecoration , Boolean 	, Enable or disable log decoration
	enableTextLog 		  , Boolean 	, Enable or disable text log and report
	enableHTMLLog 		  , Boolean 	, Enable or disable HTML log and report
   enableRealTimeLog   , Boolean    , Enable or disable read time logs
	enableExtentReport  , Boolean 	, Enable or disable the Extent report
   enableJUnitReport   , Boolean    , Enable or disable JUnit report
   enableLogCleanup    , Boolean    , Enable or disable cleaning up previous logs prior to execution
	
..

One of the following log level can be selected:

.. csv-table:: 
	:header: .,.,.,.,.,.
	:widths: 20, 20, 20, 20, 20, 20
	:stub-columns: 0

	info, debug, trace, fatal, warn, all
	
..

Log file path construction: ``logRootDir + test suite packageName + log file``.

.. code-block:: text
    :linenos:
    :emphasize-lines: 0

	./reporting/com.artos.featuretest/com.artos.tests_0_190713-17.53.20.183-all.log

..
			
Enabling log decoration will add following information in front of each log line.

.. code-block:: xml
	:emphasize-lines: 0

	* [%-5level] = Log level up to 5 char max
	* [%d{yyyy-MM-dd_HH:mm:ss.SSS}] = Date and time 
	* [%t] = Thread number
	* [%F] = File where logs are coming from
	* [%M] = Method which generated log
	* [%c{-1}] = ClassName which issued logCommand

.. 

Log files and reports are generated with following specification:

>>> File naming convention:
Runner package name + Thread number + TestSuite name (if specified) + date and time + Log Type + file extension

.. code-block:: text
	:emphasize-lines: 0

	// Text log file example
	* com.artos.feature1_0_xyz_190713-17.53.20.183-all.log
	* com.artos.feature1_0_xyz_190713-17.53.20.183-realtime.log
	* com.artos.feature1_0_xyz_190713-17.53.20.183-summary.log

	// HTML log file example
	* com.artos.feature1_0_xyz_190713-17.53.20.183-all.html
	* com.artos.feature1_0_xyz_190713-17.53.20.183-realtime.html
	* com.artos.feature1_0_xyz_190713-17.53.20.183-summary.html

	// Extent report file example
	* com.artos.feature1_0_xyz_190713-17.53.20.183-all-extent.html

..

<smtp_settings>
###############

The ``<smtp_settings>`` tag provides a way to configure SMTP settings for the email.

Attribute

.. csv-table:: 
	:header: Name, Description
	:widths: 20, 80
	:stub-columns: 0
			
	profile, profile name

..

Properties

.. csv-table:: 
	:header: Property Name, Content, Description, Example
	:widths: 30, 13, 15, 42
	:stub-columns: 0
			
	ServerAddress 				, String 	, SMTP server address 		, ``smtp.gmail.com``
	SSLPort 					   , Integer 	, SSL Port number 			, ``587``
	SMTPAuth 					, Boolean 	, Enable SMTP Authentication, ``true``
	SendersName 				, String 	, Email sender's name 		, ``John Murray``
	SendersEmail 				, String 	, Sender's email address 	, ``test@gmail.com``
	emailAuthSettingsFilePath 	, String 	, Email credential file path, ``.\conf\user_auth_settings.xml``
	ReceiversEmail 				, String 	, Receiver's email address 	, ``test@gmail.com``
	ReceiversName 				, String 	, Receiver's Name 			, ``Mac Murray``
	EmailSubject 				, String 	, Email subject line 		, ``Test results``
	EmailMessage 				, String 	, Email body 				, ``This is a test Email from Artos``

..

<dashboard>
###########

Attribute

.. csv-table:: 
   :header: Name, Description
   :widths: 20, 80
   :stub-columns: 0
         
   profile, profile name

..

Properties

.. csv-table:: 
   :header: Property Name, Content, Description
   :widths: 40, 15, 45
   :stub-columns: 0
         
   dashBoardRemoteIP     , Boolean, Remote IP for Dashboard events
   dashBoardRemotePort   , Boolean, Remote Port for UDP events

..


<features>
##########

The ``<features>`` tag provides a way to enable/disable the Artos's feature.

Attribute

.. csv-table:: 
	:header: Name, Description
	:widths: 20, 80
	:stub-columns: 0
			
	profile, profile name

..

Properties

.. csv-table:: 
	:header: Property Name, Content, Description
	:widths: 40, 15, 45
	:stub-columns: 0
			
	enableGUITestSelector 			, Boolean, Enable GUI test selector
	enableGUITestSelectorSeqNumber 	, Boolean, Enable test seq on GUI test selector
	enableBanner 					, Boolean, Enable ARTOS banner
	enableOrganisationInfo 			, Boolean, Enable organization information printing
	enableEmailClient 				, Boolean, Enable email client
	enableArtosDebug 				, Boolean, Enable Artos's debug log
	generateEclipseTemplate 		, Boolean, Enable generation of Eclipse template
	generateIntelliJTemplate		, Boolean, Enable generation of IntelliJ template
	generateTestScript 				, Boolean, Enable test script generation
	stopOnFail 						, Boolean, Enable test execution stop on fail feature
   enableDashBoard            , Boolean, Enable or disable dashboard listener

..
