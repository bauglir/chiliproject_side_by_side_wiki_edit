# ChiliProject - Side by side wiki edit plugin

* http://github.com/bauglir/chiliproject_side_by_side_wiki_edit/

This plugin adds a checkbox on wiki edit pages to put the editor and the
preview window side by side.

The layout of the page is completely handled client-side. Rendering of
the preview is handled by ChiliProject itself server-side. This allows
liquid macros and such to work properly

## Installation

In your 'Gemfile', add:
```
gem chiliproject_side_by_side_wiki_edit
```

Then run either `bundle install` or `bundle update` depending on your situation.

Next, in your 'Rakefile', add:
```
require 'tasks/chiliproject_side_by_side_wiki_edit_tasks'
```

Run the installation task
```
RAILS_ENV=production rake chiliproject_side_by_side_wiki_edit:install
```

Finally cycle your application server to enable the plugin

## Updating

To update the plugin run `bundle update chiliproject_side_by_side_wiki_edit`

Rerun the installation task to make sure the plugins assets are updated
to their latest versions
```
RAILS_ENV=production rake chiliproject_side_by_side_wiki_edit:install
```

And finally cycle your application server

## LICENSE:

Refer to the [LICENSE](https://github.com/bauglir/chiliproject_side_by_side_wiki_edit/blob/master/LICENSE) file
