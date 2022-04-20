require 'rails_helper'
RSpec.describe FetchNewListingsFromEmpireFlippers, :vcr do
  it 'should return 200 code' do
    reponse = FetchNewListingsFromEmpireFlippers.run

    expect(reponse[:code]).to change { Listing.count }.by_at_least(1)
  end
end