class Covidtracker::Metadata

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


end
