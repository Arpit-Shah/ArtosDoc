Failure-Highlights
******************

Testers/Developers are generally interested in failed test-cases. Monitoring logs on a console is generally a first step towards debugging and following that tester/developer starts to look for log files/reports. ARTOS generates **Failure-Highlights** on a console to help user speed up debugging. Failure-Highlights help them quickly judge the area/feature of mot failures. Failure-Highlights also includes ```Importance Indicator``` if specified which helps user priorities test debugging.

If mature IDE is used then Failure-Highlights will appear red in color to draw an attention of user.

.. Note:: Failure information is already present in log files/reports so Failure-Highlights will not be recorded in any of the files. It will go away as soon as console is cleared.

Failure-Highlights Example
##########################

Failure Highlight without Importance Indicator

.. Image:: Failure_Highlight_Dataprovider.png

Failure Highlight + Importance Indicator

.. Image:: Failure_Highlight_Importance_Indicator.png