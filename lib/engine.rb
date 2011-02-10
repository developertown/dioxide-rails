require 'dioxide_rails'
require 'rails'
require 'action_controller'

module Dioxide
  class Engine < Rails::Engine

    # Config defaults
    config.mount_at = '/api'
    
    # Load rake tasks
    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    end
    
    # Check the gem config
    initializer "check config" do |app|

      # make sure mount_at ends with trailing slash
      config.mount_at += '/'  unless config.mount_at.last == '/'
    end
  end
end
