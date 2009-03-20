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

Because Stereotype Extension keeps the the settings in the `Radiant::Config` table it is highly recommended to install the [Settings Extension][rse] 
  
    git submodule add git://github.com/Squeegy/radiant-settings.git vendor/extensions/settings
    
Next install the [Stereotype Extension][rste]

    git submodule add ......github repository
    
Configuration
---

Usage
---


[radiant]: http://radiantcms.org/
[aissac]: http://aissac.ro
[rste]: http://blog.aissac.ro/radiant/stereotype-extension
[rcfe]: htpp://custom_fields
[rse]: http://github.com/Squeegy/radiant-settings/tree/master