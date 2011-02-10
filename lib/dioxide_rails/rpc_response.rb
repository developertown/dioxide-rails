
module Dioxide
  # This class wraps up an RPC Response of the following form (represented here as a hash):
  #
  # {
  #   :request_id => 0,
  #   :status_code => 200,
  #   :message => "OK",
  #   :payload => {foo: 'bar'}
  # }

  class RPCResponse
  
    attr_accessor :request_id, :status_code, :message, :payload
  
    def initialize(request_id)
      @request_id = request_id
      @status_code = 200
      @message = "OK"
      @payload = {}
    end
  end
end
