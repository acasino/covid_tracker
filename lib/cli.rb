class Covidtracker::CLI
    
    def run
        greeting
        list_states
        goodbye
    end

    def greeting
        puts "Now loading COVID TRACKER..."
    end

    #display state instance by name
    def list_states
        Covidtracker::Coviddata.all.each do |s|
            puts "State: #{s.state}"
        end
        binding.pry
    end

    def goodbye
        puts "Thank you for using COVID TRACKER."
        puts "STAY HEALTHY; STAY SAFE."
    end
    

    # #find state by receiving argument
    # def find_state(state_name)
    #     @@all.detect {|s| state_name == @state}
    # end    


end
