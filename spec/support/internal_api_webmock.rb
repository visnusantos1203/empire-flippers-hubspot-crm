require 'sinatra/base' 
require_relative 'json_reader'
class InternalApiWebmock < Sinatra::Base 
  include JsonReader 
  get '/users/*' do 
    if params['users']
       json_response 200, 'internal-api-webmock/valid-users.json' 
    else
       json_response 404, 'internal-api-webmock/invalid-users.json ' 
    end 
  end 
end

module JsonReader 
  def json_response(response_code, file_name) 
    content_type: json 
    status response_code 
    File.open(Rails.root.to_s + '/spec/fixtures/mock_responses/' + file_name, 'rb').read 
  end 
end