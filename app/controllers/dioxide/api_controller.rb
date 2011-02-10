
module Dioxide
  # require 'dioxide_rails'
  class ApiController < ApplicationController

    unloadable
  
    def call
      puts "Here's mount_at?  #{Dioxide::Engine::config.mount_at}"
      
      req = RPCRequest.new(request.body)
    
      begin
        #Locate the handler class
        handlerClass = Dioxide::Engine::config.handlers[req.uri]
        logger.debug("Loaded handler class #{handlerClass} for uri #{req.uri}")
      
        handler = handlerClass.new
      
        method = handler.method(req.method.to_sym)
      
        res = method.call req
      
        render :json => res
      
      rescue Exception => e
        logger.error("Error processing RPCRequest:\n#{req}")
        logger.error e.backtrace.join("\n")
      
        res = req.new_response
        res.status_code = 500
        res.message = "Server Error"
      
        render :json => res
        return
      end
    end
  
  end
end
