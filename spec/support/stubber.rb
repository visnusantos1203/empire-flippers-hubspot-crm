module Stubber 
  def internal_api_stubber(method, host) 
    stub_request(method, host).to_rack(InternalApiWebmock) 
  end 
end