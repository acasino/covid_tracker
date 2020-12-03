class Covidtracker::CLI
    
    def run
        greeting
        list_states
        ask_state
        goodbye
    end

    #opening message and new instance of data
    def greeting
        puts "Now loading COVID TRACKER..."
        Covidtracker::API.new.get_all_state_current
        Covidtracker::API.new.get_state_metadata  #############
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
        print_data(response)
    end

    #display user input and initiate #list_data
    def print_data(state)
        puts "You chose: "
        list_data(state)        
    end

    #display instance attributes based on user state choice
    def list_data(state)
        puts "------------------------------"
        puts "State: #{Covidtracker::Coviddata.find_by_state_name(state).state}"
        puts "Date: #{Covidtracker::Coviddata.find_by_state_name(state).date}"
        puts "Positive cases: #{Covidtracker::Coviddata.find_by_state_name(state).positive}"
        puts "Negative cases: #{Covidtracker::Coviddata.find_by_state_name(state).negative}"
        puts "Positive Case Increase: #{Covidtracker::Coviddata.find_by_state_name(state).positiveIncrease}"
        puts "Hospitalized: #{Covidtracker::Coviddata.find_by_state_name(state).hospitalized}"
        puts "Recovered: #{Covidtracker::Coviddata.find_by_state_name(state).recovered}"
        puts "Deaths: #{Covidtracker::Coviddata.find_by_state_name(state).death}"
        puts "------------------------------"

        # Ask to choose another state
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

    #closing message
    def goodbye
        puts "Closing application..."
        puts "TAKE CARE AND STAY HEALTHY"
    end
    

end
