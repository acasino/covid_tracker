class Covidtracker::CLI
    
    def run
        greeting
        list_states
        ask_state
        # get_state
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
        puts Covidtracker::Coviddata.find_by_state_name(response)
    end

    # #lookup state by user input
    # def get_state(response)
    #     find_by_state_name(response)
    # end

    #ask user what date they want to see

    #asks user if they want to see metadata


    def goodbye
        puts "Thank you for using COVID TRACKER."
        puts "STAY HEALTHY; STAY SAFE."
    end
    

    # #find state by receiving argument
    # def find_state(state_name)
    #     @@all.detect {|s| state_name == @state}
    # end    


end
