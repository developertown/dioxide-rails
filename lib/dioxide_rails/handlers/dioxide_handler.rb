
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