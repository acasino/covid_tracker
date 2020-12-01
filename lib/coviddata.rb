class ::Covidtracker::Coviddata

    # attr_accessor :date, :state, :states, :positive, :negative, :pending, :hospitalized, :recovered, :lastModified, :death, :deathIncrease, :hospitalizedIncrease, :negativeIncrease, :positiveIncrease, :totalTestResultsIncrease, :dataQualityGrade

    @@all = []

    #create new states
    def initialize(state_hash)
        state_hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end

    
end

