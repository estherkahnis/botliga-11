require "rubygems"
require 'json'
require 'net/http'
require "calculator"

class Botliga

  TOKEN = 'sotbt8ndvud3c1vgpyyxgh29'

  def send_tip
    calculator = Calculator.new retrieve_matches
    results = calculator.calculate_results
    send_results results
  end

  private

  def retrieve_matches
    url = "http://botliga.de/api/matches/2011"
    response = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(response.body)
  end

  def send_results results
    results.each { |key, value| send_result key, value }
  end

  def send_result match_id, result
    http = Net::HTTP.new('botliga.de', 80)
    response, data = http.post('/api/guess', "match_id=#{match_id}&result=#{result}&token=#{TOKEN}")
    puts "#{response.code} #{data}"
  end

end

Botliga.new.send_tip


# Aktueller Spieltag
# http://openligadb-json.heroku.com/api/current_group?league_shortcut=bl1

# Spieldaten für einen Spieltag
# http://openligadb-json.heroku.com/api/matchdata_by_group_league_saison?league_shortcut=bl1&league_saison=2011&group_order_id=2

# Alle Spiele
# http://openligadb-json.heroku.com/api/matchdata_by_league_saison?league_saison=2011&league_shortcut=bl1
