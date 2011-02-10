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
  
  # A simple handler class to server as a demonstration handler,
  # and to fulfill a sometimes useful ping functionality, if desired.
  class DioxideHandler
    
    # This simple creates a new response and returns it
    # (new responses default to status_code 200 and message 'OK')
    def ping(req)
      req.new_response
    end
  end
end