require "httparty"
require "json"

module TotallyCoolArt

  class Ticket

    attr_accessor :gallery_number,:name,:date, :id
    
    def initialize(gallery_number,name,date, id=nil)
      @gallery_number = gallery_number
      @name = name
      @date = date
      @id = id
    end

    def save
      response = HTTParty.post('http://arts-api.herokuapp.com/tickets' , {
        :body => { 
          :ticket => { 
            :exhibition_id => gallery_number, 
            :name => name,
            :entry_at => date
          }
        }
      })
      ticket_details = response.parsed_response
      self.id = ticket_details["id"]
      ticket_details

    end

    def delete(id)
      HTTParty.delete('http://arts-api.herokuapp.com/tickets/#{id}')
    end

  end

end