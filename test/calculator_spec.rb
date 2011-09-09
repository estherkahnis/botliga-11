# calculator_spec.rb
require "rspec"
require '../src/calculator'


describe Calculator, "#calculate_results" do
  it "should return the calculated results" do
    matches = [finished_match_1, unfinished_match]
    calculator = Calculator.new matches
    result = calculator.calculate_results
    result['14008'].should == nil
    result['14009'].should == "1:0"
  end
end

def finished_match_1
  {
      "group" => 1,
      "guestName" => "Hamburger SV",
      "_id" => "4e06601d6f1764ac3ad869a5",
      "date" => "2011-08-05T18:30:00.000Z",
      "hostId" => 1,
      "id" => "14008",
      "season" => "2011",
      "hostGoals" => 3,
      "guestId" => 2,
      "hostName" => "Borussia Dortmund",
      "guestGoals" => 1}
end

def unfinished_match
  {
      "group" => 1,
      "guestName" => "Hamburger SV",
      "_id" => "4e06601d6f1764ac3ad869a5",
      "date" => "2011-08-05T18:30:00.000Z",
      "hostId" => 1,
      "id" => "14009",
      "season" => "2011",
      "hostGoals" => nil,
      "guestId" => 2,
      "hostName" => "Borussia Dortmund",
      "guestGoals" => nil}
end