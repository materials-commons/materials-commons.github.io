---
Title: Materials Commons Python API
layout: default
---

Materials Commons Python API
============================
**[View Python API on GitHub](https://github.com/materials-commons/mcapi/tree/master/python)**
-- Return to [top level page](../)
-- Go to [API details page](sphinx/html) --

Overview
--------

In this document, we describe the Python API (Application Programmer Interface)
to the Materials Commons server. We assume that the reader has used
(or is otherwise familiar with) the Materials Commons web site,
[https://materialscommons.org/](https://materialscommons.org/), and intends to use
this interface in that context. If you are using another
site based on the materials commons web application, that is
with will have a different URL, then corrections to
the instructions will have to be made, accordingly.

This API supports creating, modifying, and deleting Materials
Commons Projects and their parts: Experiments, Processes, Samples,
Directories, and Files. These "objects of discourse" are depicted
in this object-relation sketch.

![A box and line diagram of the core pojects and their relationships](./images/MaterialsCommonsCoreObject.png)

The object with the white backgrounds (Project, Experiment,
Process, File, Directory, and Dataset) are the main objects that
one uses to create a project in Materials Commons and the Python
API lets a user create and manipulate each of these object type,
except for Dataset. Since Dataset's are used as the means of
publishing data on the public data site for Materials Commons, we
felt it best that the web site should be used for that final
publication.

In the diagram above the lines between the objects a
relationship, but do not specify the nature of that relationship.
In this document, those relations can be thought of as "contains"
in the following way:
* **Project** contains:
  * a list of **Experiment**
  * a root **Directory**
  * a list of **File**
  * a list of **Sample**
  * a list of **Process**
* an **Experiment** contains:
  * a list of **File**
  * a list of **Sample**
  * a list of **Process**
* a **Directory** contains
  * a list of **Directory** and **File**

These objects are described in the [API details page](./api) .

Access to the API
-----------------

Using the API requires a configuration with a **base url** and an **apikey**.
The configuration is set up using the file **~/.materialscommons/config.json**
(where ~ denoted the user's home directory) . 
The URL for the API support by the production version of the
Materials Commons is: <code>materialscommons.org/api</code>. To
access test site, the corresponding url would be <code>test.materialscommons.org/api</code>.

For example, suppose the apikey for a given user is
"12345678901234567890".
Then that users might the file **~/.materialscommons/config.json**
which contained the following json:
```
"apikey": "12345678901234567890",
"mcurl": "http://mctest.localhost/api"
```

As a user of the API, you can determine your API key in this way.
Log into the MaterialsCommons web site, and on the home page, you
will see your user name in the upper right hand corner - this is
the link to the user-pull-down menu.

![Showing Position of User Menu](images/MC_UserMenu.png)

Select the menu (click on the link), select "Account Settings"
in the menu, and select "show API key" on the resulting page. This
will display your API Key. Be careful with this value: possesing
it is equivlent to having your username and password.

If you do not have a Materials Commons account, go to the web site and register.

Calls to the API
----------------

Most of the calls to the API are based on the contains
relationship described above. For example, to create an **Experiment**
you first have to create or obtain a **Project**, because Experments
are contains in Projects. These actions, create, modify, delete and others,
are "methods" of an object; that is, they are functions that are called
using the object that they pertain to. Except in the case of a few "top level function", you
first have to obtain the object. For example to make an API call
to create a process from a template, you first have to obtain an
Experiment: Process objects are "contained" in an Experiment.
Then, to create the Experiment, you would first have to obtain a
Project object. Since the project object is a top level object,
there is a function (not part of any object), to create a project.
So the sequence of calls might look like this:
```
myProject = create_project("Project One","This is my first Project")
myExperiment = myProject.create_experiment("Experiment","This is my first Experiment")
```

Where ```create_project``` is a top level function, and ```create_experiment``` is a method
of **Project**. For complete details see [API details page](./api) .

More Code Examples
------------------

(coming soon - next release is end of June 2017)

Return to [top level page](../)