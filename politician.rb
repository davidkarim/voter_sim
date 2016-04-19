class Politician < Person
  attr_accessor :party

  def initialize(name, party)
    super(name)
    #@name = name # instance variable inherited from Person
    @party = party
    @@politicians << self
  end
end
