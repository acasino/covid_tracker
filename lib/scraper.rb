require_relative "../config/environment"
#Scraper file to get data
class Covidtracker::Scraper

    #initialize url
    def initialize
        @url = "https://api.covidtracking.com/v1/states/current.json"
    end

    #get current data, all states
    def get_all_state_current
        uri = URI(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)

    end


    



end


