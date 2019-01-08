
Framework Configuration
***********************

Purpose:
########

User can customize framework behavior by changing appropriate argument(s) from ``conf/framework_configuration.xml`` file.

Facilities:
###########

If not present, Artos will generate default configuration file at location ``conf/framework_configuration.xml``. User can override some of the framework configuration using ``Runner`` object constructor. List of configurable features:

* Organization information (Stamped on top of log file).
* Change logger configuration:

	* Log level
	* Log base directory path.
	* Log sub directory path.
	* Enable/disable log decoration.
	* Enable/disable text logs.
	* Enable/disable HTML logs.
	* Enable/disable Extent report generation.

* Configure email client settings.
* Enable/disable:

	* Enable/disable GUI test selector.
	* Enable/disable GUI test selector sequence number.
	* Enable/disable framework banner.
	* Enable/disable organization information.
	* Enable/disable E-Mail client.
	* Enable/disable Artos debug log.
	* Enable/disable auto generation of Eclipse IDE default template.
	* Enable/disable auto generation of the test scripts.
	* Enable/disable stop on fail.

Sample framework_configuration.xml:
###################################

.. code-block:: XML
	:linenos:
	:emphasize-lines: 0

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="framework_configuration.xsd">
	  <organization_info profile="dev">
	    <property name="Name">Organisation PTY LTD</property>
	    <property name="Address">XX, Test Street, Test address</property>
	    <property name="Country">NewZealand</property>
	    <property name="Contact_Number">+64 1234567</property>
	    <property name="Email">artos.framework@gmail.com</property>
	    <property name="Website">www.theartos.com</property>
	  </organization_info>
	  <logger profile="dev">
	    <!--LogLevel Options : info:debug:trace:fatal:warn:all-->
	    <property name="logLevel">debug</property>
	    <property name="logRootDir">.\reporting\</property>
	    <property name="logSubDir">SN-123</property>
	    <property name="enableLogDecoration">false</property>
	    <property name="enableTextLog">true</property>
	    <property name="enableHTMLLog">false</property>
	    <property name="enableExtentReport">true</property>
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
	  <features profile="dev">
	    <property name="enableGUITestSelector">true</property>
	    <property name="enableGUITestSelectorSeqNumber">true</property>
	    <property name="enableBanner">true</property>
	    <property name="enableOrganisationInfo">true</property>
	    <property name="enableEmailClient">false</property>
	    <property name="enableArtosDebug">false</property>
	    <property name="generateEclipseTemplate">false</property>
	    <property name="generateTestScript">true</property>
	    <property name="stopOnFail">false</property>
	  </features>
	</configuration>

..

Artos support multiple configurations. If user required different configuration for development and production/build environment then user can store both configuration in same configuration file with unique profile names.

Profile Selection:
##################

* User can specify profile name via command line using parameter ``--profile="prod"``.
* If profile name is not specified then **first configuration from the top** of the framework_configuration.xml file will be used.
* If configurations are missing from the file then default value will be used.

**Example:** If user requires GUITestSelector enabled for development environment but disabled for production environment then both profiles can be stored as shown below.

Sample framework_configuration.xml with two profiles:
#####################################################

.. code-block:: XML
	:linenos:
	:emphasize-lines: 0

	<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<configuration xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="framework_configuration.xsd">
	  
	  <!-- Development configuration -->
	  <organization_info profile="dev">
	    <property name="Name">Organisation PTY LTD</property>
	    <property name="Address">XX, Test Street, Test address</property>
	    <property name="Country">NewZealand</property>
	    <property name="Contact_Number">+64 1234567</property>
	    <property name="Email">artos.framework@gmail.com</property>
	    <property name="Website">www.theartos.com</property>
	  </organization_info>
	  <logger profile="dev">
	    <!--LogLevel Options : info:debug:trace:fatal:warn:all-->
	    <property name="logLevel">debug</property>
	    <property name="logRootDir">.\reporting\</property>
	    <property name="logSubDir">SN-123</property>
	    <property name="enableLogDecoration">false</property>
	    <property name="enableTextLog">true</property>
	    <property name="enableHTMLLog">false</property>
	    <property name="enableExtentReport">true</property>
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
	  <features profile="dev">
	    <property name="enableGUITestSelector">true</property>
	    <property name="enableGUITestSelectorSeqNumber">true</property>
	    <property name="enableBanner">true</property>
	    <property name="enableOrganisationInfo">true</property>
	    <property name="enableEmailClient">false</property>
	    <property name="enableArtosDebug">false</property>
	    <property name="generateEclipseTemplate">false</property>
	    <property name="generateTestScript">true</property>
	    <property name="stopOnFail">false</property>
	  </features>

	  <!-- Production configuration -->
	  <organization_info profile="prod">
	    <property name="Name">Organisation PTY LTD</property>
	    <property name="Address">XX, Test Street, Test address</property>
	    <property name="Country">NewZealand</property>
	    <property name="Contact_Number">+64 1234567</property>
	    <property name="Email">artos.framework@gmail.com</property>
	    <property name="Website">www.theartos.com</property>
	  </organization_info>
	  <logger profile="prod">
	    <!--LogLevel Options : info:debug:trace:fatal:warn:all-->
	    <property name="logLevel">debug</property>
	    <property name="logRootDir">.\reporting\</property>
	    <property name="logSubDir">SN-123</property>
	    <property name="enableLogDecoration">false</property>
	    <property name="enableTextLog">true</property>
	    <property name="enableHTMLLog">false</property>
	    <property name="enableExtentReport">true</property>
	  </logger>
	  <smtp_settings profile="prod">
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
	  <features profile="prod">
	    <property name="enableGUITestSelector">false</property>
	    <property name="enableGUITestSelectorSeqNumber">false</property>
	    <property name="enableBanner">true</property>
	    <property name="enableOrganisationInfo">true</property>
	    <property name="enableEmailClient">false</property>
	    <property name="enableArtosDebug">false</property>
	    <property name="generateEclipseTemplate">false</property>
	    <property name="generateTestScript">true</property>
	    <property name="stopOnFail">false</property>
	  </features>

	</configuration>

..