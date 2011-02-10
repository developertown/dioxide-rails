module Dioxide
  class Engine < Rails::Engine
    
    # Step 1:
    # Configure the mount point for the RPC API handler
    config.mount_at = '/api'
    
    
    # Step 2:
    # Add any necessary require statements here to include your handler classes
    # e.g., for a handler class in RAILS_ROOT/lib/users_handler.rb:
    
    # require 'users_handler'

    # Step 3:
    # Map URIs to handlers
    config.handlers = {
      "/dioxide" => Dioxide::DioxideHandler,
      #"/users" => ::UsersHandler
    }

  end
end
