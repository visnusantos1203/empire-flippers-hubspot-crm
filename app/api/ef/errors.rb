module Ef
  class Errors
    def self.map(code)
      case code
      when 401
        'Unauthorized request. Please try again!'
      when 404
        'Invalid Request!'
      else
        'Service Unavailable. Please try again!'
      end
    end
  end
end