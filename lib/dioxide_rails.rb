module Dioxide
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require 'dioxide_rails/rpc_request'
  require 'dioxide_rails/rpc_response'
  require 'dioxide_rails/handlers'
end

