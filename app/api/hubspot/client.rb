module Hubspot
  class Client
    def self.get_crm_objects(params)
      Request.call('get', "crm/v3/objects/#{params}")
    end

    def self.create_deal(params)
      Request.post('crm/v3/objects/deals', params)
    end

    def self.search_deal(params)
      Request.search(params)
    end
  end
end