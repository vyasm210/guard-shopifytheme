require 'guard'
require 'guard/plugin'
# require "guard/shopifytheme/version"


module Guard
  class Shopifytheme < Plugin

    VERSION = "0.0.1"

    def initialize(options = {})
      super
    end

    # Called once when Guard starts. Please override initialize method to init stuff.
    #
    # @raise [:task_has_failed] when start has failed
    # @return [Object] the task result
    #
    def start
     if File.exist? 'config.yml'
        Notifier.notify "Watching for changes to Shopify Theme"
      else
        data = <<-EOF
---
:api_key: YOUR_API_KEY
:password: YOUR_PASSWORD
:store: YOURSHOP.myshopify.com
:theme_id: 'YOUR_THEME_ID'
:ignore_files:
- README.md
- CHANGELOG.md
EOF
        File.open('./config.yml', "w") { |file| file.write data }
        Notifier.notify "Created config.yml. Remember to add your Shopify details to it."
      end
    end

    # Called when `stop|quit|exit|s|q|e + enter` is pressed (when Guard quits).
    #
    # @raise [:task_has_failed] when stop has failed
    # @return [Object] the task result
    #
    # def stop
    # end

    # Called when `reload|r|z + enter` is pressed.
    # This method should be mainly used for "reload" (really!) actions like reloading passenger/spork/bundler/...
    #
    # @raise [:task_has_failed] when reload has failed
    # @return [Object] the task result
    #
    # def reload
    # end

    # Called when just `enter` is pressed
    # This method should be principally used for long action like running all specs/tests/...
    #
    # @raise [:task_has_failed] when run_all has failed
    # @return [Object] the task result
    #
    # def run_all
    # end

    # Default behaviour on file(s) changes that the Guard plugin watches.
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_change has failed
    # @return [Object] the task result
    #
    def run_on_changes(paths)
      paths.each do |path|
        system "theme upload #{path}"
      end
    end

    # Called on file(s) additions that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_additions has failed
    # @return [Object] the task result
    #
    # def run_on_additions(paths)
    # end

    # Called on file(s) modifications that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_modifications has failed
    # @return [Object] the task result
    #
    # def run_on_modifications(paths)
    # end

    # Called on file(s) removals that the Guard plugin watches.
    #
    # @param [Array<String>] paths the changes files or paths
    # @raise [:task_has_failed] when run_on_removals has failed
    # @return [Object] the task result
    #
    def run_on_removals(paths)
      paths.each do |path|
        system "theme remove #{path}"
      end
    end
  end
end