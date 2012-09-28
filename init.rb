require 'redmine'

Redmine::Plugin.register :chiliproject_side_by_side_wiki_edit do
  name 'Chiliproject Side By Side Wiki Edit plugin'
  author 'Joris Kraak'
  description 'This plugin enables an option to show the preview of a wiki page, side-by-side with the wiki editor'
  version ChiliprojectSideBySideWikiEdit::VERSION
  url 'http://github.com/bauglir/chiliproject_side_by_side_wiki_edit'
  author_url 'http://majorfail.com'
end

require 'chiliproject_side_by_side_wiki_edit/hooks/view_wiki_edit_hook'
