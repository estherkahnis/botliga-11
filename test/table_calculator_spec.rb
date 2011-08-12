# table_calculator_spec.rb
require "rspec"
require '../src/table_calculator'


describe TableCalculator, "#table" do
  it "should return points of all teams" do
    matches = [finished_match, finished_drawn_match, unfinished_match]
    table_calculator = TableCalculator.new matches
    table = table_calculator.table
    table[1].should == 3
    table[2].should == 0
    table[3].should == 1
    table[4].should == 1
  end
end

def finished_match
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

def finished_drawn_match
  {
      "group" => 1,
      "guestName" => "SC Freiburg",
      "_id" => "4e06601d6f1764ac3ad869aa",
      "date" => "2011-08-06T13:30:00.000Z",
      "hostId" => 3,
      "id" => "14013",
      "season" => "2011",
      "hostGoals" => 2,
      "guestId" => 4,
      "hostName" => "FC Augsburg",
      "guestGoals" => 2}
end

def unfinished_match
  {
      "group" => 1,
      "guestName" => "Hamburger SV",
      "_id" => "4e06601d6f1764ac3ad869a5",
      "date" => "2011-08-05T18:30:00.000Z",
      "hostId" => 7,
      "id" => "14008",
      "season" => "2011",
      "hostGoals" => nil,
      "guestId" => 100,
      "hostName" => "Borussia Dortmund",
      "guestGoals" => nil}
end