class Covidtracker::CLI

    STATES = 
    [
        "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", 
    "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", 
    "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", 
    "VA", "WA", "WV", "WI", "WY", "DC", "GU", "MP", "PR", "VI"
    ]
    
    def run
        greeting
        list_states
        # map
        ask_state
        goodbye
    end

    #opening message and new instance of data
    def greeting
        puts "Now loading COVID TRACKER..."
        Covidtracker::API.new.get_all_state_current
        Covidtracker::API.new.get_state_metadata  
    end

    #display all available states
    def list_states
        Covidtracker::Coviddata.all.each do |s|
            puts "State: #{s.state}"
        end
    end

    #asks user which state they want to see
    def ask_state
        puts "What state would you like to see?:"
        response = gets.upcase.strip
        if STATES.include?(response)
            print_data(response)
        else
            puts "------------------------------"
            puts "Please put valid state or territory abbreviation."
            ask_state
        end
    end

    #display user input and initiate #list_data
    def print_data(state)
        puts "You chose: "
        list_data(state)        
    end

    #display instance attributes based on user state choice
    def list_data(state)
        find = Covidtracker::Coviddata.find_by_state_name(state)
        puts "------------------------------"
        puts "State: #{find.state}"
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

        if response == "Y"
            ask_state
        elsif response == "N"
            puts "------------------------------"
            puts "Thank you for using COVID TRACKER."
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
            list_meta(state)
        elsif response == "N"
            puts "------------------------------"
        else response != "Y" || response != "N"
            puts "------------------------------"
            puts "Please input 'Y' or 'N' only."
            ask_meta
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


    #closing message
    def goodbye
        puts "Closing application..."
        puts "TAKE CARE AND STAY HEALTHY"
    end

    # #USA Map
    # def map 
    #     puts "                                                                                                                                                                                                                                                                                                                                                            
    #     --./+/:-..`                                                                       
    #     :o/oooooooo++/::--..```                                                  .--      
    #     +oooooooooooooooooooo+++++////::::::::::.``                              +oo-     
    #    :oooooooooooooooooooooooooooooooooooooooooo++/- ``                       .oooo:    
    #   -oooooooooooooooooooooooooooooooooooooooooooo+:.-//:.::-`            ..-:/ooo/.`    
    #  -oooooooooooooooooooooooooooooooooooooooooooooooooooo:..//.          :ooooooo-       
    #  /ooooooooooooooooooooooooooooooooooooooooooooooooooo+``+oo/.      ``.oooooooo.       
    # .oooooooooooooooooooooooooooooooooooooooooooooooooooo+ .ooo+o.    :++ooooooo+/-`      
    # :oooooooooooooooooooooooooooooooooooooooooooooooooooo+  +ooo+` `-/oooooooo+:.`        
    # -ooooooooooooooooooooooooooooooooooooooooooooooooooooo::oooo+//+oooooooooo/           
    #  /ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo++/.           
    #  -ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo/:/            
    #  `ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-.            
    #   :ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-            
    #   `/+ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-            
    #     `-+oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+.`            
    #       `+ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo+-`              
    #        `.../+ooooooooooooooooooooooooooooooooooooooooooooooooooooooo/`                
    #             `.:+ooooooooooooooooooooooooooooooooooooooooooooooooooo.                  
    #        `.``     `.--:-..-+oooooooooooooooooooooooooooooooooooooooo/                   
    #       :ooo+/-            `-oooooooooooooooooooooooooo++++//+oo+ooo+`                  
    #      -/ooooo/              :+o/:/+oooooooooo++/+++o+/.`     .. .:oo+.                 
    #     `:/ooooo/      `        `.   `+oooooo++-`     ..``           /oo+.                
    #      -+o+/:/:``      `````        `/ooo+-`                       `+ooo.               
    #      `.-.    `--`        .:`        +oo:                           -+o-               
    #     `          ``        `.         `.--                            `.    
        
    #     "
    # end

end