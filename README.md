Modifier Related To Parent
===
A linter for scss-lint (https://github.com/brigade/scss-lint). Warns when a modifier is attached to a class which it doesn't share a base name with. The following is valid, and ensures that the modifier is named after the parent it modifies, and works only on that parent.

    .widget-textField {

        &.widget-textField--show {
            ...
        }
    }

Invalid (in this case the modifier won't work at all) :

    .widget-textField {

        .widget-textField--show {
            ...
        }
    }

Also invalid is the following. While this CSS works, the modifier can be reused on multiple parents in ways, causing tight coupling and possible errors when the modifier's function is unclear to other developers.

    .widget-textField {

    }

    .widget-textField--show {
        ...
    }



Config
---

linters:

    ModifierRelatedToParent:
        # set to true to enable
        enabled: true

Use
---
This linter is currently not available as a Gem. To use it, place /lib/ModifierRelatedToParent.rb in a folder on your system, then add that folder to your .scss-lint.yml file as follows

    plugin_directories: ['/foo/bar']