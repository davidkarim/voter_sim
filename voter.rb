class Voter < Person

  attr_accessor :politics

  def initialize(name, politics)
    super(name)
    #@name = name # instance variable inherited from Person
    @politics = politics
    @@voters << self
  end

end
