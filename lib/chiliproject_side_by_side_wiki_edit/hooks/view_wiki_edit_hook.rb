module ChiliprojectSideBySideWikiEdit
  module Hooks
    class ViewWikiEditHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context = {})
        if context[:controller] && context[:controller].is_a?(WikiController) && (context[:controller].action_name == 'edit')
          asset_path = '/plugin_assets/chiliproject_side_by_side_wiki_edit'
          [
            javascript_include_tag("#{asset_path}/javascripts/side_by_side_edit.js"),
            stylesheet_link_tag("#{asset_path}/stylesheets/side_by_side_edit.css")
          ]
        end
      end
    end
  end
end
