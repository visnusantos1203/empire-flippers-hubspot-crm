class ConfigHubspot < ApplicationService
  def call
    # Hubspot.configure do |config|
    #   # Configure API key authorization: hapikey
    #   config.api_key['hapikey'] = '5e5f3fa8-db6d-4463-8027-17a802fdf5d7'
    # end
    result = Hubspot.configure(
      hapikey: '5e5f3fa8-db6d-4463-8027-17a802fdf5d7',
      
    )
    { code: 200, status: "Success", data: result }
  end
end