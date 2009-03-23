Radiant Stereotype Extension
===

About
---

An extension by [Aissac][aissac] that adds templating support to [Radiant CMS][radiant].

Features
---

Instalation
---

Stereotype Extension has one dependency, the [Radiant Custom Fileds Extension][rcfe].

    git submodule add ....... github repository

Because Stereotype Extension keeps the settings in the `Radiant::Config` table it is highly recommended to install the [Settings Extension][rse]
  
    git submodule add git://github.com/Squeegy/radiant-settings.git vendor/extensions/settings
    
Finally, install the [Stereotype Extension][rste]

    git submodule add ....... github repository
    
Configuration
---

To add stereotypes you need to add fields to the Radiant::Config table. The table has the following structure:

     Radiant::Config(id: integer, key: string, value: string, description: text)
     


Usage
---

By using [Stereotype Extension][rste] you can control the way a new page is created. You can choose the new page parts along with their filters, the layout and the page type.

[Stereotype Extension][rste] adds a drop down at the bottom of the page form. Setting a stereotype on a page will force all it's first level children to be created with the settings associated with the chosen stereotype.

[radiant]: http://radiantcms.org/
[aissac]: http://aissac.ro
[rste]: http://blog.aissac.ro/radiant/stereotype-extension
[rcfe]: htpp://blog.aissac.ro/radiant/custom-fields-extension
[rse]: http://github.com/Squeegy/radiant-settings/tree/master