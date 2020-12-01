require_relative "../config/environment"
#Scraper file to get data
class Covidtracker::API

    #initialize url
    def initialize
        #URL for all states current data
        @url = "https://api.covidtracking.com/v1/states/current.json"
    end

    #get all states current data
    def get_all_state_current
        uri = URI(@url)
        response = Net::HTTP.get(uri) #return response as string
        data = JSON.parse(response) #parse JSON, return array
        ####
        # Covidtracker::Coviddata.new(data) #initialize new instance of all state current data
    end

    #method to separate each state into separate hash to initialize
    


end


Covidtracker::API.new.get_all_state_current