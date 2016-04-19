require "./voter_sim.rb"
require "stringio"
# Reference for RSpec matchers: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
# Reference for redirecting input: http://stackoverflow.com/questions/17258630/how-do-i-write-an-rspec-test-for-a-ruby-method-that-contains-gets-chomp

describe Politician do
  context "A politician" do
    hillary = Politician.new("Hillary", "Democrat")
    donald = Politician.new("Donald", "Republican")
    marco = Politician.new("Marco Rubio", "Republican")
    it "should have a name" do
      expect(hillary.name).to eq("Hillary")
      expect(donald.name).to eq("Donald")
      expect(marco.name).to eq("Marco Rubio")
    end
    it "should have a party" do
      expect(hillary.party).to eq("Democrat")
      expect(donald.party).to eq("Republican")
      expect(marco.party).to eq("Republican")
    end
  end
end

describe Voter do
  context "A voter" do
    david = Voter.new("David", "Conservative")
    laura = Voter.new("Laura", "Independent")
    it "should have a name" do
      expect(david.name).to eq("David")
      expect(laura.name).to eq("Laura")
    end
    it "should have a party affiliation" do
      expect(david.politics).to eq("Conservative")
      expect(laura.politics).to eq("Independent")
    end
  end
end

describe Questions do
  context "What to create" do
    before do
      $stdin = StringIO.new("P\n")
    end
    it "should respond with P" do
      expect(Questions.what_to_create).to be == "P"
    end
  end
  context "What is the name" do
    before do
      $stdin = StringIO.new("Donald\n")
    end
    # after do
    #   $stdin = STDIN
    # end
    it "should respond with Donald" do
      expect(Questions.give_name).to be == "Donald"
    end
  end
  context "What is the party" do
    before do
      $stdin = StringIO.new("R\n")
    end
    after do
      $stdin = STDIN
    end
    it "should respond with R" do
      expect(Questions.give_party).to be == "R"
    end
  end
end

describe World do
  context "List politicians" do
    it "should not be empty" do
      expect(World.show_politicians).not_to be_empty
    end
  end
  context "List voters" do
    it "should not be empty" do
      expect(World.show_voters).not_to be_empty
    end
  end
end
