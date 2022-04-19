Rails.application.routes.draw do
  # resources :listings
  namespace :api do
    namespace :v1, defaults: { format: :json }  do
      resources :hubspot
      resources :ef
    end
  end
end
