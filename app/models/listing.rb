class Listing < ApplicationRecord
  validates :listing_number, :listing_price, :summary, :close_date, presence: true
  validates :listing_number, uniqueness: true
end
