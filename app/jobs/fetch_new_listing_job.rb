class FetchNewListingJob < ApplicationJob
  require 'sidekiq-scheduler'
  queue_as :default

  def perform(*args)
    # Checks how many pages if limit is 20 per query
    pages = Ef::Client.get_listings(20)[:data]["data"]["pages"]
    # Checks all the total count of all listings in the API
    listing_count = Ef::Client.get_listings(1)[:data]["data"]["count"]
    # Iterates based on the number of pages

    pages.times do |count|
      # Fetches 20 listings from page equal to the current index + 1
      result = Ef::Client.get_listings(20, count + 1)[:data]["data"]["listings"]
      
      # Iterates over the result and creates new listing to the Listing model
      result.each do |listing|
        # Checks if there is an existing listing where listing_number is equal to listing["listing_number"]
        unless Listing.exists?(listing_number: listing["listing_number"])
          new_listing = Listing.new()

          new_listing.listing_number = listing["listing_number"]
          new_listing.listing_price = listing["listing_price"]
          new_listing.summary = listing["summary"]
          new_listing.close_date = (Time.now + 30.days).strftime("%FT%TZ") # or Date.today + 30

          new_listing.save

          unless new_listing.save
            next
          end
        end
      end
    end

    CreateHubspotDealJob.perform_later
  end
end
