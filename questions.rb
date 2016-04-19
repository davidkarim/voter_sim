require "./enhance_io.rb"

module Questions
  def self.what_to_do
    options = ["C", "L", "U", "D", "E"]
    response = ""
    until options.include? response
      puts "What would you like to do?"
      puts "(C)reate, (L)ist, (U)pdate, (D)elete, or (E)xit"
      response = gets.chomp.upcase
    end
    return response.upcase
  end

  def self.what_to_create
    options = ["P", "V"]
    response = ""
    until options.include? response
      puts "What would you like to create?"
      puts "(P)olitician or (V)oter"
      response = gets.chomp.upcase
    end
    return response.upcase
  end

  def self.give_name
    response = ""
    until response != ""
      puts "What is the name?"
      response = gets.chomp
    end
    return response
  end

  def self.give_party
    options = ["R", "D"]
    response = ""
    until options.include? response
      puts "What is your political party?"
      puts "(R)epublican or (D)emocrat"
      response = gets.chomp.upcase
    end
    return response.upcase
  end

  def self.give_politics
    options = ["L", "C", "T", "S", "N"]
    response = ""
    until options.include? response
      puts "What is your political affiliation?"
      puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
      response = gets.chomp.upcase
    end
    return response.upcase
  end

  def self.who_to_update(current_list = nil)
    response = ""
    until response != ""
      puts "Who would you like to update?"
      response = EnhanceIO.input_auto(current_list)
    end
    return response
  end

  def self.update_name
    response = ""
    until response.length > 1
      puts "Give a new name (or just hit Enter/Return for no change)?"
      response = gets.chomp
      return "" if response == ""
      puts "Name must be at least 2 characters." if response.length < 2
    end
    return response
  end

  def self.update_party
    options = ["R", "D"]
    response = ""
    until options.include? response
      puts "Update political party"
      puts "(R)epublican (D)emocrat or hit Enter/Return key for no change"
      response = gets.chomp.upcase
      return "" if response == ""
    end
    return response.upcase
  end

  def self.update_politics
    options = ["L", "C", "T", "S", "N"]
    response = ""
    until options.include? response
      puts "Update political affiliation"
      puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, (N)eutral, or hit Enter/Return for no change"
      response = gets.chomp.upcase
      return "" if response == ""
    end
    return response.upcase
  end

  def self.delete_person(current_list = nil)
    response = ""
    until response.length >1
      puts "Who would you like to delete from the list (hit Enter/Return for no one)?"
      response = EnhanceIO.input_auto(current_list)
      return "" if response == ""
      puts "Name must be at least 2 characters." if response.length < 2
    end
    return response
  end

end
