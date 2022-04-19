require 'rails_helper'
RSpec.describe ConfigHubspot, type: :service do
  it 'should return 200 code' do
    config = ConfigHubspot.call

    expect(config[:code]).to be 200
  end
end