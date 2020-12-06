class Covidtracker::CLI

    
    #run sequence for CLI
    def run
        system "clear"
        greeting
        ask_state
        goodbye
    end


    #opening message and new instance of data
    def greeting
        puts "Now loading COVID TRACKER..."
        Covidtracker::API.new.get_all_state_current
        Covidtracker::API.new.get_state_metadata  
    end


    #asks user which state they want to see
    def ask_state
        prompt = TTY::Prompt.new
        pre_response = prompt.select("Which state/territory would you like to view?", %w(AL-Alabama AK-Alaska AZ-Arizona AR-Arkansas CA-California CO-Colorado CT-Conneticut DE-Delaware FL-Florida GA-Georgia HI-Hawaii ID-Idaho IL-Illinois IN-Indiana IA-Iowa KS-Kansas KY-Kentucky LA-Louisiana ME-Maine MD-Maryland MA-Massachusetts MI-Michigan MN-Minnesota MS-Mississippi MO-Missouri MT-Montana NE-Nebraska NV-Nevada NH-NewHampshire NJ-NewJersey NM-NewMexico NY-NewYork NC-NorthCarolina ND-NorthDakota OH-Ohio OK-Oklahoma OR-Oregon PA-Pennsylvania RI-RhodeIsland SC-SouthCarolina SD-SouthDakota TN-Tennessee TX-Texas UT-Utah VT-Vermont VA-Virginia WA-Washington WV-WestVirginia WI-Wisconsin WY-Wyoming DC-WashingtonDC GU-Guam MP-NorthernMarianas PR-PuertoRico VI-VirginIslands))
        response = pre_response[0, 2]
        print_data(response)
    end


    #display user input and initiate #list_data
    def print_data(state)
        puts "Loading data: "
        sleep(0.4)
        list_data(state)        
    end


    #display instance attributes based on user state choice
    def list_data(state)
        find = Covidtracker::Coviddata.find_by_state_name(state)
        puts "------------------------------"
        puts "State: #{Covidtracker::Metadata.find_by_state_name(state).name}"
        puts "Date: #{find.date}"
        puts "Positive cases: #{find.positive}"
        puts "Negative cases: #{find.negative}"
        puts "Positive Case Increase: #{find.positiveIncrease}"
        puts "Hospitalized: #{find.hospitalized}"
        puts "Recovered: #{find.recovered}"
        puts "Deaths: #{find.death}"
        puts "------------------------------"

        #Ask if user would like to see metadata
        ask_meta(state) #pass in state to #ask_meta to hold onto instance

        #Ask to choose another state
        ask_another
        
    end


    #method to ask for another state input
    def ask_another
        puts "Choose another state?: Y/N"
        response = gets.upcase.strip
        sleep(0.3)
        system "clear"

        if response == "Y"
            ask_state
        elsif response == "N" || response == "EXIT"
            exit
        else response != "Y" || response != "N"
            puts "------------------------------"
            puts "Please input 'Y' or 'N' only."
            ask_another
        end
    end


    #method to ask if user would like to see metadata
    def ask_meta(state)
        puts "Display state metadata?: Y/N"
        response = gets.upcase.strip

        if response == "Y"
            sleep(0.5)
            list_meta(state)
        elsif response == "N"
            sleep(0.3)
            puts "------------------------------"
        else 
            sleep(0.3)
            puts "------------------------------"
            puts "Please input 'Y' or 'N' only."
            ask_meta(state)
        end
    end


    #method to retrieve metadata
    def list_meta(state)
        find = Covidtracker::Metadata.find_by_state_name(state)
        puts "------------------------------"
        puts "State: #{find.name}"
        puts "State Website: #{find.covid19Site}"
        puts "Twitter: #{find.twitter}"
        puts "Additional Notes: #{find.notes}"
        puts "------------------------------"
    end


    #early exit
    def exit
        puts "------------------------------"
        puts "Thank you for using COVID TRACKER."    
    end


    #closing message
    def goodbye
        puts "Closing application..."
        sleep(0.5)
        puts "TAKE CARE AND STAY HEALTHY"
    end


end