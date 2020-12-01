class Covidtracker::Coviddata

    # attr_accessor :date, :state, :states, :positive, :negative, :pending, :hospitalized, :recovered, :lastModified, :death, :deathIncrease, :hospitalizedIncrease, :negativeIncrease, :positiveIncrease, :totalTestResultsIncrease, :dataQualityGrade

    @@all = []

    def initialize(data_hash)
        data_hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        @@all << self
    end


end

# Covidtracker::Coviddata.new.initialize