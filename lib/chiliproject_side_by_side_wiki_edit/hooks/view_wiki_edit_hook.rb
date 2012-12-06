module ChiliprojectSideBySideWikiEdit
  module Hooks
    class ViewWikiEditHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context = {})
        if wiki_controller?(context) && extendable_action?(context)
          asset_path = '/plugin_assets/chiliproject_side_by_side_wiki_edit'
          [
            javascript_include_tag("#{asset_path}/javascripts/side_by_side_edit.js"),
            stylesheet_link_tag("#{asset_path}/stylesheets/side_by_side_edit.css")
          ]
        end
      end

      def extendable_action?(context)
        # For some reason ChiliProject uses the show action instead of the new
        # action to create new wiki pages. This does mean that the javascript
        # and stylesheets get loaded on regular wiki pages as well
        context[:controller] && ['show', 'edit'].include?(context[:controller].action_name)
      end

      def wiki_controller?(context)
        context[:controller] && context[:controller].is_a?(WikiController)
      end
    end
  end
end
