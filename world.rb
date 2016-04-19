class World
  @@voters = []
  @@politicians = []

  attr_accessor :country, :city, :district

  def initialize
    @country = "USA"
  end

  def self.politicians
    @@politicians
  end

  def self.voters
    @@voters
  end

  def self.show_voters
    @@voters.each do |voter|
      puts "Voter #{voter.name} is a #{voter.politics}"
    end
  end

  def self.show_politicians
    @@politicians.each do |politician|
      puts "Politician #{politician.name} is a #{politician.party}"
    end
  end

end
