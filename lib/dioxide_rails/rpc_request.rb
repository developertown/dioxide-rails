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

require 'dioxide_rails/rpc_response'

module Dioxide
  # This class wraps up an RPC Request of the following form (represented here as a hash):
  #
  # {
  #   :request_id => 0,
  #   :uri => "/users",
  #   :method => "create",
  #   :device_id => "235234-2342-234-234-2342",
  #   :session_id => "asdf980808as0df090a9d",
  #   :payload => {foo: 'bar'}
  # }

  class RPCRequest
    attr_reader :request_id, :uri, :method, :device_id, :session_id, :payload
  
    def initialize(req)    
      if (req.class != Hash)
        req = ActiveSupport::JSON.decode(req)
      end

      raise Exception.new("RPC Request is missing required parameter: uri") unless req.has_key?("uri")
      raise Exception.new("RPC Request is missing required parameter: method") unless req.has_key?("method")
    
      @request_id = req["request_id"]
      @uri = req["uri"]
      @method = req["method"]
      @device_id = req["device_id"]
      @session_id = req["session_id"]
      @payload = req["payload"]
    end
  
    def to_s
      to_json
    end
  
    def new_response
      RPCResponse.new(@request_id)
    end
  end
end
