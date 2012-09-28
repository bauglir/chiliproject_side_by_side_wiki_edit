module ChiliprojectSideBySideWikiEdit
  module Hooks
    class ViewWikiEditHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context = {})
        if context[:controller] && context[:controller].is_a?(WikiController) && (context[:controller].action_name == 'edit')
          javascript_include_tag '/plugin_assets/chiliproject_side_by_side_wiki_edit/javascripts/side_by_side_edit.js'
        end
      end
    end
  end
end
