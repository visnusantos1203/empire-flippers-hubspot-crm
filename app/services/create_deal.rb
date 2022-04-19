class CreateDeal < ApplicationService
  require 'hubspot-api-client'
  
  def call
    ConfigHubspot.call

    properties = {
      "amount": "1500.00",
      "closedate": Listing.first.close_date,
      "dealname": "Listing #{Listing.first.listing_number} ",
      "dealstage": "presentation scheduled",
      "hubspot_owner_id": "169738666",
      "pipeline": "default"
    }
    simple_public_object_input = Hubspot::Crm::Deals::SimplePublicObjectInput.new(properties: properties)
    begin
      api_response = Hubspot::Crm::Deals::BasicApi.new.create(simple_public_object_input, auth_names: "hapikey")
      puts api_response
    rescue Hubspot::Crm::Deals::ApiError => e
      error_message = JSON.parse(e.response_body)['message']
      puts error_message
    end
  end
end