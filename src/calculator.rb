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
    table_difference = table[host_id] - table[guest_id]

    host_goals = (table_difference > 0 ? table_difference.abs / 4 : 0) + 1
    guest_goals = table_difference < 0 ? table_difference.abs / 4 : 0

    guest_goals, host_goals = normalize_goals guest_goals, host_goals

    p "Spieltag #{match['group']}: #{match['hostName']}-#{match['guestName']} [#{host_goals}:#{guest_goals}]"
    "#{host_goals}:#{guest_goals}"
  end

  def normalize_goals guest_goals, host_goals
    max_difference = 3
    goals_difference = (host_goals - guest_goals).abs
    if goals_difference > max_difference
      if host_goals > guest_goals
        host_goals = host_goals - (goals_difference - max_difference)
      else
        guest_goals = guest_goals - (goals_difference - max_difference)
      end
    end
    return guest_goals, host_goals
  end

  def match_finished? match
    match['hostGoals'] && match['guestGoals']
  end

end