require "./questions.rb"
require "./world.rb"
require "./person.rb"
require "./voter.rb"
require "./politician.rb"

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
      Politician.new(name, party)
    when "V" # Voter
      name = Questions.give_name
      politics = politics_list[Questions.give_politics.to_sym]
      Voter.new(name, politics)
    end
  when "L"
    puts "********* List *********"
    World.show_politicians
    World.show_voters
    puts "*" * 24
  when "U"
    response = Questions.who_to_update

    World.politicians.map do |politician|
      if politician.name == response
        name = Questions.update_name
        if name != ""
          politician.name = name
          puts "Politican being modded #{politician.name}"
        end
        party = Questions.update_party
        if party != ""
          politician.party = party_list[party.to_sym]
          puts "Politician party modded #{politician.party}"
        end
      end
    end

    World.voters.map do |voter|
      if voter.name == response
        name = Questions.update_name
        if name != ""
          voter.name = name
          puts "Voter being modded #{voter.name}"
        end
        politics = Questions.update_politics
        if politics != ""
          voter.politics = politics_list[politics.to_sym]
          puts "Voter politics are now #{voter.politics}"
        end
      end
    end

  when "D"
    puts "Here is the current list"
    World.show_politicians
    World.show_voters
    puts ""
    response = Questions.delete_person
    if World.politicians.index { |politician| politician.name == response }.nil? && World.voters.index { |voter| voter.name == response }.nil?
      puts "- Person not found"
    else
      # Delete_if gives no indication whether delete is succesful or not,
      # so need to do previous (index) command first.
      World.politicians.delete_if { |politician| politician.name == response }
      World.voters.delete_if { |voter| voter.name == response }
      puts "- #{response} has been deleted."
    end
  end
end
