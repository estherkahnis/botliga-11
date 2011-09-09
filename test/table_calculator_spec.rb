# table_calculator_spec.rb
require "rspec"
require '../src/table_calculator'


describe TableCalculator, "#table" do
  it "should return points of all teams" do
    matches = [finished_match, finished_drawn_match, unfinished_match]
    table_calculator = TableCalculator.new matches
    table = table_calculator.table
    table[1].should == 4
    table[2].should == 0
    table[3].should == 1
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
      "group" => 2,
      "guestName" => "Hertha BSC",
      "_id" => "4e0660206f1764ac3ad869c2",
      "date" => "2011-08-13T13:30:00.000Z",
      "hostId" => 3,
      "id" => "14019",
      "season" => "2011",
      "hostGoals" => 2,
      "guestId" => 1,
      "hostName" => "Hamburger SV",
      "guestGoals" => 2}
end

def unfinished_match
  {
      "group" => 3,
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