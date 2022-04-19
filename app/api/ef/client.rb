module Ef
  class Client
    def self.get_listings(limit, page = 1)
      Request.call('get', "listings/list?page=#{page}&listing_status=For%20Sale&limit=#{limit}")
    end

  end
end