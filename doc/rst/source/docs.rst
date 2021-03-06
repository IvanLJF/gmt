.. index:: ! docs

****
docs
****

.. only:: not man

    Show the HTML documentation for selected module

Synopsis
--------

.. include:: common_SYN_OPTs.rst_

**gmt docs** [ **-Q** ] [ **-S** ] [ |SYN_OPT-V| ] *module-name* [*-option*]

|No-spaces|

Description
-----------

**docs** tells GMT to display the HTML version of a module's documentation using the default browser.
Besides the modules names, the special targets *cookbook*, *gallery*, *defaults*, *api* and *tutorial*
are also accepted.

Optional Arguments
------------------

**-Q**
    This option means we are doing a "dry-run" and simply want the final URL to be
    printed to standard output.  No file open command will take place. This is useful
    if you are working remotely on a server and do not wish to launch a GUI browser.
    If used, **-Q** must be the first option to **docs**.

**-S**
    Normally, **docs** will open documentation files from the local computer if the document can
    be found there; otherwise it will use the GMT server.  The **-S** option forces **docs** to
    read the file from the web server first.

.. _-V:

.. |Add_-V| unicode:: 0x20 .. just an invisible code
.. include:: explain_-V.rst_

.. include:: explain_help_nopar.rst_

Optional Module Arguments
-------------------------

*-option*
    Where *-option* is the one-letter option of the module in question (e.g, **-R**).
    We then display the *module* documentation positioned at that specific option.  Note
    that this operation is only valid for an actual URL, hence we implicitly set
    **-S** when an option anchor is specified.

Examples
--------

To see the documentation of *grdimage*

   ::

    gmt docs grdimage

To see the link to the documentation of *grdimage*

   ::

    gmt docs -Q grdimage

To see the link to the documentation of *grdimage* on the GMT server

   ::

    gmt docs -Q -S grdimage

To see the documentation of the **-B** option in *pscoast*

   ::

    gmt docs pscoast -B

To examine the list of GMT defaults, try

   ::

    gmt docs defaults

To see the Gallery

   ::

    gmt docs gallery


See Also
--------

:doc:`begin`,
:doc:`clear`,
:doc:`end`,
:doc:`figure`,
:doc:`inset`,
:doc:`subplot`,
:doc:`gmt`
