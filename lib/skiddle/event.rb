module Skiddle
	class Event < Document
    def self.find_by_event_id(event_id)
      Client.make_request(Event, "/events/#{event_id}")
    end

    def self.search(params = {})
      Client.make_request(Event, "/events", params)
    end
	end
end