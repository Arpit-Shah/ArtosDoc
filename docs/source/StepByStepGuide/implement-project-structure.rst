Implement Project
*****************

ARTOS test project consists of two components:

* Test Runner
* Test Case(s)

The project can be configured in many different ways as per the business requirement.

Recommended Project Structures
##############################

Feature Structure
=======================

* Packages and sub-packages are organized based on features.
* Each package has its own Runner class thus each package acts as a test suite.

    .. image:: ProjectStructure_Features.png

Super Structure
===============

* Packages and sub-packages are organized based on features.
* Project contains a single Runner. All test cases are within Runner's scan scope thus entire project acts as a single test suite.
* This can also be achieved by having Runner at project root location.

    .. image:: ProjectStructure_Super.png

Tree Structure (Feature Tree)
=============================

This structure is a mixture of the above structures.

* Packages and sub-packages are organized based on features or a test group.
* Project contains Runner class at parent/root position as well as inside each feature packages.
* The test suite executes limited or all test cases depending on the executed Runner.

    .. image:: ProjectStructure_FeatureTree.png
