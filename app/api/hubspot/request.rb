module Hubspot
  class Request
  
    BASE_URL = Rails.application.credentials.hubspot[:base_url]
    HAPIKEY = Rails.application.credentials.hubspot[:hapikey]

    def self.call(http_method, params)
      result = RestClient::Request.execute(
        method: http_method,
        url: "#{BASE_URL}#{params}?hapikey=#{HAPIKEY}"
      )

      { code: result.code, status: "Success", data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
    end

    def self.post(endpoint, params)
      ConfigHubspot.call

      result = RestClient.post "#{BASE_URL}?hapikey=#{HAPIKEY}", params.to_json, { "content_type": "application/json" }

      { code: result.code, status: "Success", data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }
    end

    def self.search(params)

      result = RestClient.post "#{BASE_URL}crm/v3/objects/deals/search?hapikey=#{HAPIKEY}",
      {
        "filterGroups": [
          {
            "filters": [
              {
                "value": "Listing #{params}",
                "propertyName": "dealname",
                "operator": "EQ"
              }
            ]
          }
        ],
        "sorts": [
          "string"
        ],
        "query": "Listing",
        "properties": [
          "dealname"
        ],
        "limit": 20,
        "after": 0
      }.to_json, { "content_type": "application/json" , "content-length": "190" }

    { code: result.code, status: "Success", data: JSON.parse(result.body) }
    rescue RestClient::ExceptionWithResponse => e
      { code: e.http_code, status: e.message, data: Errors.map(e.http_code) }

    end
  end
end