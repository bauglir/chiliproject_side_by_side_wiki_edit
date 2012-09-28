require 'rake'
require 'rake/tasklib'

class ChiliprojectSideBySideWikiEditTasks < Rake::TaskLib
  def initialize
    define
  end

  def define
    namespace :chiliproject_side_by_side_wiki_edit do
      desc "Install ChiliprojectSideBySideWikiEdit plugin (include assets, etc)"
      task :install => [:symlink_assets]

      desc "Uninstalls ChiliprojectSideBySideWikiEdit plugin (removes database modifications, removes assets, etc)"
      task :uninstall => [:environment] do
        puts "Removing link to ChiliprojectSideBySideWikiEdit assets (stylesheets, js, etc)..."
        remove_symlink asset_destination_dir
        puts post_uninstall_steps
      end

      task :symlink_assets => [:environment] do
        # HACK: Symlinks the files from plugindir/assets to the appropriate place in
        # the rails application
        puts "Symlinking assets (stylesheets, etc)..."
        add_symlink asset_source_dir, asset_destination_dir
      end
    end
  end

  private
    def application_root
      File.expand_path(RAILS_ROOT)
    end

    def gem_root
      @gem_root ||= File.expand_path(File.dirname(__FILE__) + "/../..")
    end

    def asset_destination_dir
      @destination_dir ||= File.expand_path("#{application_root}/public/plugin_assets/chiliproject_side_by_side_wiki_edit")
    end

    def asset_source_dir
      @source_dir ||= File.expand_path(gem_root + "/assets")
    end

    def remove_symlink(symlink_file)
      system("unlink #{symlink_file}") if File.exists?(symlink_file)
    end

    def add_symlink(source, destination)
      remove_symlink destination
      system("ln -s #{source} #{destination}")
    end

    def post_uninstall_steps
      [
        "!!!!! MANUAL STEPS !!!!!",
        "\t1. In your 'Gemfile', remove:",
        "\t\tgem 'chiliproject_side_by_side_wiki_edit'",
        "",
        "\t2. In your 'Rakefile', remove:",
        "\t\trequire 'tasks/chiliproject_side_by_side_wiki_edit_tasks'",
        "",
        "\t3. Run 'bundle' (or 'bundle install') to update your Gemfile.lock",
        "",
        "\t4. Cycle your application server (mongrel, unicorn, etc)",
        "\n",
      ].join("\n")
    end
end

ChiliprojectSideBySideWikiEditTasks.new
