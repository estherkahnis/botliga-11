# calculator.rb

class Calculator

  def initialize matches
    @matches = matches
  end

  def calculate_results
    result = {}
    @matches.each do |match|
      next if match_finished? match

      result[match['id']] = calculate_result
    end
    result
  end

  private

  def calculate_result
    "#{2}:#{1}"
  end

  def match_finished? match
    match['hostGoals'] && match['guestGoals']
  end

end