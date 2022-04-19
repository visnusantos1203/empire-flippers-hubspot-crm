FactoryBot.define do
  factory :listing do
    listing_number { 1 }
    listing_price { 10.00 }
    summary { "test summary" }
    close_date { Time.now }
  end
end
