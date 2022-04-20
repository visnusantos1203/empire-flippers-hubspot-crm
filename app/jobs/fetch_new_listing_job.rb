class FetchNewListingJob < ApplicationJob
  require 'sidekiq-scheduler'
  queue_as :default

  def perform(*args)
    FetchNewListingsFromEmpireFlippers.run
    CreateHubspotDeals.run
  end
end
