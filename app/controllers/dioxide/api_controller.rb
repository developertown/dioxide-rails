# Copyright 2011 Developer Town
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Dioxide
  # require 'dioxide_rails'
  class ApiController < ApplicationController

    unloadable
  
    def call
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
