Radiant Stereotype Extension
===

About
---

An extension by [Aissac][aissac] that adds templating support to [Radiant CMS][radiant]. With this extension, creating a new page becomes a lot easier, because you're able to set some attributes of the new page, like the page parts (along with filters), layout, page type.
 
Features
---

* Provides the ability to create standardized new pages
* You can control the new page's parts, filters, layout and page type

Instalation
---

Stereotype Extension has one dependency, the [Radiant Custom Fields Extension][rcfe].

    git submodule add ....... github repository

Because Stereotype Extension keeps the settings in the `Radiant::Config` table it is highly recommended to install the [Settings Extension][rse]
  
    git submodule add git://github.com/Squeegy/radiant-settings.git vendor/extensions/settings
    
Finally, install the [Stereotype Extension][rste]

    git submodule add ....... github repository
    
Configuration
---

To add stereotypes you need to add fields to the Radiant::Config table. There are three types of settings for each stereotype:

1. Page Parts (and filters)

The key has to look like: `stereotype.name_of_the_stereotype.parts` and the value `body:markdown,sidebar:textile`

2. Layout

The key has to look like: `stereotype.name_of_the_stereotype.layout` and the value has to be the name of a layout (case sensitive)

3. Page type

The key should look like: `stereotype.name_of_the_stereotype.page_type` and the value has to be a valid `class_name` attribute of the Page class. (Examples: ArchivePage, FileNotFoundPage or ArchiveMonthIndexPage)

Usage
---

By using [Stereotype Extension][rste] you can control the way a new page is created. You can choose the new page parts along with their filters, the layout and the page type.

[Stereotype Extension][rste] adds a drop down at the bottom of the page form. Setting a stereotype on a page will force all it's first level children to be created with the settings associated with the chosen stereotype.

[radiant]: http://radiantcms.org/
[aissac]: http://aissac.ro
[rste]: http://blog.aissac.ro/radiant/stereotype-extension
[rcfe]: htpp://blog.aissac.ro/radiant/custom-fields-extension
[rse]: http://github.com/Squeegy/radiant-settings/tree/master