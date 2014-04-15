require "httparty"
require "json"

module TotallyCoolArt

  class Gallery

    def list_of_galleries
      response = HTTParty.get('http://arts-api.herokuapp.com/galleries').parsed_response
    end

    def specific_gallery(number)
      response = HTTParty.get("http://arts-api.herokuapp.com/galleries/#{number}").parsed_response
    end

    def exhibitions_at_gallery(number)
      response = HTTParty.get("http://arts-api.herokuapp.com/galleries/#{number}/exhibitions").parsed_response
    end

  end

  # puts Gallery.new.list_of_galleries
end 