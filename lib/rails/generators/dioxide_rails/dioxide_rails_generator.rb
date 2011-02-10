require 'rails/generators'
require 'rails/generators/migration'

class DioxideRailsGenerator < Rails::Generators::Base

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/dioxide_rails.rb'
  end
end
