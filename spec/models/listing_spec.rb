require 'rails_helper'

RSpec.describe Listing, type: :model do
  context 'with validation' do
    let(:listing) { create(:listing) }
    
    it 'is not valid without listing_number' do
      listing.listing_number = nil
      expect(listing).not_to be_valid
    end
    it 'is not valid without listing_price' do
      listing.listing_price = nil
      expect(listing).not_to be_valid
    end
    it 'is not valid without summary' do
      listing.summary = nil
      expect(listing).not_to be_valid
    end
    it 'is not valid without close_date' do
      listing.close_date = nil
      expect(listing).not_to be_valid
    end

  end
end
