require "./questions.rb"
require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"

# Puts all names in WOrld in an array
def list_of_names
  World.politicians.map { |p| p.name } + World.voters.map { |p| p.name}
end

response = ""
politics_list = {L: "Liberal", C: "Conservative", T: "Tea Party", S: "Socialist", N: "Neutral"}
party_list = {R: "Republican", D: "Democrat"}

system "clear" # Clear the screen

until ["E", "e"].include? response
  puts ""
  puts "****** Main Menu *******"
  response = Questions.what_to_do
  case response
  when "C"
    case Questions.what_to_create
    when "P" # Politician
      name = Questions.give_name
      party = party_list[Questions.give_party.to_sym]
      voters_and_politicians = list_of_names
      # If politician hasn't yet been created, then add
      if !(voters_and_politicians.map { |p| p.downcase }.include? name.downcase)
        Politician.new(name, party)
      else
        puts "This person has already been created. Names must be unique."
      end
    when "V" # Voter
      name = Questions.give_name
      politics = politics_list[Questions.give_politics.to_sym]
      # If voter hasn't yet been created, then add
      if !(voters_and_politicians.map { |p| p.downcase }.include? name.downcase)
        Voter.new(name, politics)
      else
        puts "This person has already been created. Names must be unique."
      end
    end
  when "L"
    puts "********* List *********"
    World.show_politicians
    World.show_voters
    puts "*" * 24
  when "U"
    voters_and_politicians = list_of_names
    response = Questions.who_to_update(voters_and_politicians)

    World.politicians.map do |politician|
      if politician.name.downcase == response.downcase
        name = Questions.update_name
        if name != ""
          politician.name = name
          puts "Politican name changed to #{politician.name}"
        end
        party = Questions.update_party
        if party != ""
          politician.party = party_list[party.to_sym]
          puts "Politician party changed to #{politician.party}"
        end
      end
    end

    World.voters.map do |voter|
      if voter.name.downcase == response.downcase
        name = Questions.update_name
        if name != ""
          voter.name = name
          puts "Voter name changed to #{voter.name}"
        end
        politics = Questions.update_politics
        if politics != ""
          voter.politics = politics_list[politics.to_sym]
          puts "Voter politics changed to #{voter.politics}"
        end
      end
    end

  when "D"
    puts "Here is the current list"
    World.show_politicians
    World.show_voters
    puts ""
    voters_and_politicians = list_of_names
    response = Questions.delete_person(voters_and_politicians)
    # if World.politicians.index { |politician| politician.name.downcase == response.downcase }.nil? && World.voters.index { |voter| voter.name.downcase == response.downcase }.nil?
    if !(voters_and_politicians.map { |p| p.downcase }.include? response.downcase)
      puts "- Person not found"
    else
      # Delete_if gives no indication whether delete is succesful or not,
      # so need to do previous (index) command first.
      World.politicians.delete_if { |politician| politician.name.downcase == response.downcase }
      World.voters.delete_if { |voter| voter.name.downcase == response.downcase }
      puts "- #{response} has been deleted."
    end
  end
end
