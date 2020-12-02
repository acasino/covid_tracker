class Covidtracker::CLI
    
    def run
        greeting
        list_states
        ask_state
        goodbye
    end

    def greeting
        puts "Now loading COVID TRACKER..."
        Covidtracker::API.new.get_all_state_current
    end

    #display state instance by name
    def list_states
        Covidtracker::Coviddata.all.each do |s|
            puts "State: #{s.state}"
        end
    end

    #asks user which state they want to see
    def ask_state
        puts "What state would you like to see?"
        response = gets.strip
        # Covidtracker::Coviddata.find_by_state_name(response)
        print_data(response)
    end

    def print_data(state)
        puts "You chose #{state}:"
        if state = Coviddata.find_by_state_name(state)
            puts "Current Positive Cases: #{Covidtracker::Coviddata.state.positive}"
        end
    end


    def goodbye
        puts "Thank you for using COVID TRACKER."
        puts "STAY HEALTHY; STAY SAFE."
    end
    

end
