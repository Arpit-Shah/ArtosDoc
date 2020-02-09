.. _Artos_Maven_Repository: https://mvnrepository.com/artifact/com.theartos/artos/
.. _Artos_Eclipse_Template: https://github.com/Arpit-Shah/Artos/tree/master/src/com/artos/template/
.. _Artos_IntelliJ_Template: https://github.com/Arpit-Shah/Artos/tree/master/src/com/artos/template/

System Setup
************

System requirements
###################

* Platform

    * Windows, Linux, MAC or any platform which can run **Java 8** or above.

* JDK

    * Artos can be integrated with any Java project compiled with **JDK 8U45** or higher.

Add Artos Jar as a dependency
#############################

* Non-Maven Projects

    * Download latest Artos jar from the location - Artos_Maven_Repository_.
    * Add jar to project build path.

* Maven Projects

    * Copy latest jar dependency XML block from the location - Artos_Maven_Repository_.
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

Eclipse IDE
###########

Install ANSI plug-in for Linux OS
=================================

* Go to Eclipse SDK => Help => Eclipse Marketplace.
* Find "ANSI escape in console" plug-in.
* Install the plug-in.
* Restart Eclipse SDK.

Configure test templates:
=========================

The use of a Java template avoids typing error and increase test development speed. Once imported, templates can be edited to suit business needs.

Import default templates:

* Download **template.xml** file from location : Artos_Eclipse_Template_ .
* In Eclipse IDE, browse to Window => Preferences => Java => Editor => Templates.
* Click on **Import** button.
* Import downloaded **template.xml** file.
* Following templates will be added

    * Artos_Runner
    * Artos_TestCase
    * Artos_BDD

Use template:
=============

* Create a new Java class.
* Select and delete all the content of the class.
* Type **art** and press **CTRL + SPACE**.
* Template suggestion (IntelliSense) list will appear as shown below.

    .. image:: TemplateSelection.png

* Select desired template.
* Skeleton code will be added to the class.
* Write BDD test plan inside ```bdd``` attribute under ```@TestPlan``` annotation.
* Start writing test logic between two green lines.

    .. image:: WriteCodeHere.png

IntelliJ IDE
############

The use of a Java template avoids typing error and increase test development speed. Once imported, templates can be edited to suit business needs.

Configure test templates:
=========================

* Download **IntelliJ_template.zip** file from location : Artos_IntelliJ_Template_ .
* Browse to File => Import Settings.
* Browse and import downloaded **IntelliJ_template.zip** file.

    .. image:: ImportSettings.png

* Select both of the checkboxes.

    .. image:: SelectCheckBox.png

* Following templates will be added

    * ArtosRunner
    * ArtosTestCase

Use template:
=============

* Right-click on the package.
* Select new and choose the desired template.

    .. image:: UseTemplate.png

* Provide a class name.
* Skeleton code will be added to the class.
* Write BDD test plan inside ``bdd`` attribute under ``@TestPlan`` annotation.
* Start writing test logic between two green lines.

    .. image:: WriteCodeHere_2.png
