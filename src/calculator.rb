# calculator.rb

require '../src/table_calculator'

class Calculator

  def initialize matches
    @matches = matches
  end

  def calculate_results
    table = TableCalculator.new(@matches).table

    result = {}
    @matches.each do |match|
      next if match_finished? match

      result[match['id']] = calculate_result match, table
    end
    result
  end

  private

  def calculate_result match, table
    host_id = match['hostId']
    guest_id = match['guestId']
    difference = table[host_id] - table[guest_id]

    host_goals = (difference > 0 ? difference.abs / 4 : 0) + 1
    guest_goals = difference < 0 ? difference.abs / 4 : 0

    p "Spieltag #{match['group']}: #{match['hostName']}-#{match['guestName']} [#{host_goals}:#{guest_goals}]"
    "#{host_goals}:#{guest_goals}"
  end

  def match_finished? match
    match['hostGoals'] && match['guestGoals']
  end

end