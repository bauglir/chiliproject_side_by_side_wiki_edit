# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chiliproject_side_by_side_wiki_edit/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Joris Kraak"]
  gem.email         = ["me@joriskraak.nl"]
  gem.description   = %q{Allows side by side editor/preview functionality for ChiliProject wiki pages}
  gem.summary       = %q{This plugin adds a checkbox to the edit page for ChiliProject wiki pages, which allows a user to switch between the default behavior and a side by side editor/preview mode}
  gem.homepage      = "http://github.com/bauglir/chiliproject_side_by_side_wiki_edit"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "chiliproject_side_by_side_wiki_edit"
  gem.require_paths = ["lib"]
  gem.version       = ChiliprojectSideBySideWikiEdit::VERSION
end
