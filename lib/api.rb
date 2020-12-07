class Covidtracker::API

    #initialize url
    def initialize
        #URL for all states current data
        @url = "https://api.covidtracking.com/v1/states/current.json"
        @url_meta = "https://api.covidtracking.com/v1/states/info.json"
    end

    #get all states current data
    def get_all_state_current
        uri = URI(@url)
        response = Net::HTTP.get(uri)    #return response as string
        data = JSON.parse(response)      #parse JSON, return array
        data.each do |state|             #iterate over each data set and send to Coviddata.new to initialize 
            Covidtracker::Coviddata.new(state)
        end
    end

    #get all states metadata
    def get_state_metadata
        uri_meta = URI(@url_meta)
        response_meta = Net::HTTP.get(uri_meta)
        data_meta = JSON.parse(response_meta)
        data_meta.each do |state|
            Covidtracker::Metadata.new(state)
        end
    end

end
