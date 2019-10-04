Implement Project
*****************

ARTOS BDD test project consists of three components:

* Test Runner
* Class(s) containing test steps
* Feature File(s)

The project can be configured in many different ways as per the business requirement.

Recommended Project Structures
##############################

Super Structure
===============

* Packages and sub-packages are organized based on features.
* Project contains a single Runner that has visibility of all classes that contains step definition.

    .. image:: ProjectStructure_Super.png
