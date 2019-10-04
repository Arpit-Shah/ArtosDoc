Implement Feature File
**********************

Feature file is used to describe test scenario(s) in human readable language using Gherkin syntax. Artos accepts feature file(s) as an input and  binds scenario steps to relevant method within the test project. 

* Feature file is a text file with an extension ```.feature```. 
* Script file should be placed inside ``script`` directory of the project.

Sample Feature File
###################

.. code-block:: Text
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Feature File Sample
	
	Feature: Television Test

	  Background: User powers on Television
	    Given television is connected to power socket
	    WHEN television power is turned on
	    And television audio volume is to "50"
	    Then television displays "Television is ready for the test"
	    AND television "greed" LED is on

	  @smoke
	  Scenario Outline: Television Remote Functions works
	    Given remote button "<FunctionButtons>" is pressed
	    Then television displays "<ExpectedAction>"

	    Examples: 
	      | FunctionButtons | ExpectedAction			|
	      | ON              | television is already ON 	|
	      | MUTE            | television audio is muted	|
	      | OFF             | NA 						|
	      | ON            	| television is turned ON 	|

	  @smoke @manual
	  Scenario Outline: Volume check
	    Given television power is turned on
	    And television is configured
	      | brightness | pixel        | input | headphone | externalSpeaker |
	      |        100 | <resolution> | HDMI  | off       | true            |
	    When remote button "<FunctionButtons>" is pressed
	    Then User validates "<ExpectedAction>"

	    Examples: 
	      | FunctionButtons     | ExpectedAction           | resolution |
	      | VolumeIncrease      | Is volume higher by one? | HD         |
	      | VolumeDecrease      | Is volume lower by one?  | FULL_HD    |

..

Feature File Components
#######################

Feature
=======

* Declared using ``Feature:`` followed by description of the the feature
* Only one ``Feature:`` can be available in one feature file

.. code-block:: Text
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Feature declaration
	
	Feature: Television Test

..

Scenario 
========

* Scenario is declared using ``Scenario Outline:`` followed by description of the scenario.
* One feature file can have one or more scenarios.
* Scenario is defined using **Gherkin Syntax** which utilizes keywords "Given", "When", "And", "Then"
* Scenario lines declared with Gherkin keywords are called **Steps**.
* Scenario can be attached to one or more groups by adding group name above ``Scenario Outline:`` as shown in below example.
* Same scenario can be executed multiple time with various data by declaring example table as shown below.

	* Declare wild card within step definition by using ``"<wildcard>"`` syntax.
	* Provide a table of data which maps to the wild card.
	* First row of the each column maps the wild card.
	* During execution wild card text is replaced by text from the table.
	* Scenario will be executed repeatedly until all rows of the table is exhausted.   

.. code-block:: Text
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Scenario Example

	@smoke @regression
	Scenario Outline: Television Remote Functions works
	  Given television is on
	  And remote battery is fully charged
	  When remote button "<FunctionButtons>" is pressed
	  Then television displays "<ExpectedAction>"

	Examples: 
	    | FunctionButtons | ExpectedAction            |
	    | ON              | television is already ON  |
	    | MUTE            | television audio is muted |
	    | OFF             | NA                        |
	    | ON              | television is turned ON   |

..

Background
==========

* Declared using ``Background:`` followed by description of the background scenario
* feature file can have only one ``Background:`` scenario.
* Scenario declared under ``Background:`` is executed prior to each scenarios declared under ``Scenario Outline:``
* ``Background:`` is declared as very first scenario in feature file.

.. code-block:: Text
	:linenos:
	:emphasize-lines: 0
	:caption: Example: Background example

	Background: User powers on Television
	    Given television is connected to power socket
	    WHEN television power is turned on
	    And television audio volume is to "50"
	    Then television displays "Television is ready for the test"
	    AND television "greed" LED is on

..