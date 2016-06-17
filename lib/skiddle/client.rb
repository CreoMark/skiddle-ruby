module Skiddle
	module Client
		include HTTParty

		base_uri "http://www.skiddle.com/api/v1/"
    format :json

    def self.convert_query_to_url(params)
      params.map do |k,v|
        "&#{k}=#{v}"
      end.join
    end

    def self.make_request(klass, endpoint, params = {})
      query_url = convert_query_to_url(params)
      result = get("#{endpoint}?api_key=#{ENV['SKIDDLE_API_KEY']}#{query_url}")
      parsed_result = JSON.parse(result.body)
      if parsed_result["error"] == 1
      	parsed_result
      else
      	if parsed_result["results"].class == Array
		      objects = parsed_result["results"].map do |result|
		        klass.new(result)
		      end
      		objects.length == 1 ? objects.first : objects
		    else
		      klass.new(result)
		    end
      end
    end
	end
end