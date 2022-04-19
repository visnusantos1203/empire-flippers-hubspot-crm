module Ef
  class Request
    BASE_URL = 'https://api.empireflippers.com/api/v1/'

    def self.call(http_method, params)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{params}",
        headers: { 'Accept' => 'application/json' }
      )

      { code: result.code, status: 'Success', data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
    end
  end
end