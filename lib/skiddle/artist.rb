module Skiddle
	class Artist < Document
    def self.search(params = {})
      Client.make_request(Artist, "/artists", params)
    end
	end
end