# table_calculator.rb

class TableCalculator

  def initialize matches
    @matches = matches
  end

  def table
    result = {}

    @matches.each do |match|
      next unless match_finished? match

      host_id = match['hostId']
      guest_id = match['guestId']
      host_goals = match['hostGoals']
      guest_goals = match['guestGoals']

      result[host_id] = 0 unless result.has_key? host_id
      result[guest_id] = 0 unless result.has_key? guest_id
      result[host_id] =+calculate_points(host_goals, guest_goals)
      result[guest_id] =+calculate_points(guest_goals, host_goals)
    end

    result
  end

  private

  def calculate_points goals_1, goals_2
    if goals_1 > goals_2
      3
    elsif goals_1 == goals_2
      1
    else
      0
    end
  end

  def match_finished? match
    match['hostGoals'] && match['guestGoals']
  end

end