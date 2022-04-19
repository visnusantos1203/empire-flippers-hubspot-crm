class CreateHubspotDealJob < ApplicationJob
  queue_as :default

  def perform(*args)
    to_upload = Listing.where(uploaded: false)

    to_upload.each do |listing|
      params = {
                  "properties": {
                    "amount": "#{listing.listing_price}",
                    # Close_date should follow specific date format. Strftime converts datetime values to specified format.
                    "closedate": "#{listing.close_date.strftime("%FT%TZ")}",
                    "dealname": "Listing #{listing.listing_number}",
                    "description": "#{listing.summary}"
                  }
                }
      begin
        Hubspot::Client.create_deal(params)
      rescue
        next
      end
      
      listing.uploaded = true
      listing.save

      unless listing.save
        next
      end
    end
  end
end
