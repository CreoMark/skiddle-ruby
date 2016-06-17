module Skiddle
	class Venue < Document
    def self.find_by_venue_id(venue_id)
      Client.make_request(Venue, "/venues/#{venue_id}")
    end

    def self.search(params = {})
      Client.make_request(Venue, "/venues", params)
    end
	end
end