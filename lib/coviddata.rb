class Covidtracker::Coviddata

    # attr_accessor :date, :state, :states, :positive, :negative, :pending, :hospitalized, :recovered, :lastModified, :death, :deathIncrease, :hospitalizedIncrease, :negativeIncrease, :positiveIncrease, :totalTestResultsIncrease, :dataQualityGrade

    @@all = []

    #create new state instance with data attributes
    def initialize(state_hash)
        state_hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        end
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
    
    #find by statename
    def self.find_by_state_name(name)
        @@all.detect {|s| s.state == name}        
    end

    #list data
    def self.list_data(state)
        puts "State: #{find_by_state_name(state).state}"
        puts "Date: #{find_by_state_name(state).date}"
        puts "Positive cases: #{find_by_state_name(state).positive}"
        puts "Hospitalized: #{find_by_state_name(state).hospitalized}"
    end


end
