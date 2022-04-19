require 'rails_helper'

RSpec.describe FetchNewListingJob, type: :job do
  let(:ef_reponse) {}
  describe "by running scheduled job blabla", :vcr, js: true do
    it "fetches for number of pages" do
      VCR.use_cassette('FetchNewListingJob/fetches_for_number_of_pages', :record => :new_episodes) do
        stub_request(:get, "https://api.empireflippers.com/api/v1/listings/list?limit=20&listing_status=For%20Sale&page=1")
        .to_return(status: 200, body: ef_reponse.body, headers: {} )
        FetchNewListingJob.perform_now
      end
    end

    it "fetches listings count" do
      VCR.use_cassette('FetchNewListingJob/fetches_listings_count', :record => :new_episodes) do
        body = { "data": 
            { "listings": [] } 
        }.to_json

        stub_request(:get, "https://api.empireflippers.com/api/v1/listings/list?limit=20&listing_status=For%20Sale&page=1")
        .to_return(status: 200, body: body, headers: {} )
        FetchNewListingJob.perform_now
        
      end
      
      #expect(FetchNewListingJob).to have(1).jobs
    end
  end
end
