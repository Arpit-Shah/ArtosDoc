Implement Project
*****************

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
* Project contains a single Runner and all test cases are within Runner's scan scope thus entire project acts as single test suite.
* This can also be achieved by having Runner at project root location.

.. image:: ProjectStructure_Super.png

Tree Structure (Feature Tree)
=============================

This structure is a mixture of the above structures.

* Packages and sub-packages are organized based on features or a test group.
* Project contains Runner class in parent/root position and Runner class within each feature packages.
* The test suite executes limited or all test cases depending on the used Runner.

.. note:: Feature Tree: Suitable structure for test development where only limited test cases are required to be run.

.. image:: ProjectStructure_FeatureTree.png

