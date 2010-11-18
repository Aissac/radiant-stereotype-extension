Radiant Stereotype Extension
===

About
---

An extension by [Aissac][aissac] that adds templating support to [Radiant CMS][radiant].

Tested on Radiant 0.7.1, 0.8 and 0.9.1.

Checkout the [screencast][rc]!
 
Features
---

* Define named templates (stereotypes) for Pages;
* Templates are assigned per-parent Page, making all children have the defined 'stereotype' by their parent;
* You can specify the new page's parts, filters, layout, page type and status.

Important Notice!
---

The git branches of this repository hold stable versions of the extension for older versions of Radiant CMS. For example the _0.8_ branch is compatible with Radiant 0.8. 

To checkout one of these branches:

    git clone git://github.com/Aissac/radiant-stereotype-extension.git vendor/extensions/stereotype
    cd vendor/extensions/stereotype
    git checkout -b <branch-name> origin/<remote-branch-name>

As an example, if you're working on Radiant 0.8 you will need to checkout the 0.8 branch:
    
    cd vendor/extensions/stereotype
    git checkout -b my_branch origin/0.8

Instalation
---

Stereotype Extension has one dependency, the [Radiant Custom Fields Extension][rcfe].

    git clone git://github.com/Aissac/radiant-custom-fields-extension.git vendor/extensions/custom_fields

Because Stereotype Extension keeps the settings in the `Radiant::Config` table it is highly recommended to install the [Settings Extension][rse]
  
    git clone git://github.com/Squeegy/radiant-settings.git vendor/extensions/settings
    
Finally, install the [Stereotype Extension][rste]

    git clone git://github.com/Aissac/radiant-stereotype-extension.git vendor/extensions/stereotype


Configuration
---

To add stereotypes you need to add fields to the Radiant::Config table. There are five types of settings for each stereotype:

1.) Page Parts (and filters)

The key has to look like: `stereotype.<name_of_the_stereotype>.parts` and the value `body:Markdown,sidebar:Textile` (case sensitive).

2.) Layout

The key has to look like: `stereotype.<name_of_the_stereotype>.layout` and the value has to be the name of a layout (case sensitive).

3.) Page type

The key should look like: `stereotype.<name_of_the_stereotype>.page_type` and the value has to be a valid `class_name` attribute of the Page class. (Examples: ArchivePage, FileNotFoundPage or ArchiveMonthIndexPage).

4.) Status

The key has to look like: `stereotype.<name_of_stereotype>.status` and the value has to be a valid `status` attribute of the page: draft, hidden, reviewed, published.

5.) Stereotype

The key has to look like: `stereotype.<name_of_stereotype>.stereotype` and the value has to be a valid stereotype.

Usage
---

1.) Add stereotypes as described in the configuration section.

2.) Edit/create a new page that has children and select a stereotype from the dropdown labeled "Stereotype". Child pages added to this page will be created with their attributes set by default to the fields you configured.

3.) ...

4.) Profit!

I18n
---

This extension is translated to English and Romanian.

If you happen to translate it to some other languages please send a pull request.

Patches
---

If you want to contribute features or fixes please write your specs/cucumber features and code and submit pull requests to these github users:

  * cristi
  * ihoka

Contributors
---

* Cristi Duma ([@cristiduma][cd])
* Istvan Hoka ([@ihoka][ih])

[radiant]: http://radiantcms.org/
[aissac]: http://aissac.ro/en
[rste]: http://blog.aissac.ro/radiant/stereotype-extension
[rcfe]: http://blog.aissac.ro/radiant/custom-fields-extension
[rse]: http://github.com/Squeegy/radiant-settings/tree/master
[cd]: http://twitter.com/cristiduma
[ih]: http://twitter.com/ihoka
[rc]: http://radiantcms.org/blog/archives/2010/03/23/radiantcasts-episode-6-radiant-custom-fields-and-stereotype-extensions/