# botliga.rb

require "rubygems"
require 'json'
require 'net/http'
require "calculator"

class Botliga

  YEAR = '2012'
  TOKEN = 'sotbt8ndvud3c1vgpyyxgh29'

  def send_tip
    calculator = Calculator.new retrieve_matches
    results = calculator.calculate_results
    send_results results
  end

  private

  def retrieve_matches
    url = "http://botliga.de/api/matches/#{YEAR}"
    response = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(response.body)
  end

  def send_results results
    results.each_with_index do |(key, value), index|
      send_result key, value
      print (index + 1) % 100 != 0 ? "." : ".\n"
    end
  end

  def send_result match_id, result
    http = Net::HTTP.new('botliga.de', 80)
    response, data = http.post('/api/guess', "match_id=#{match_id}&result=#{result}&token=#{TOKEN}")
    puts "#{response.code} #{data}" unless response.code == '200'
  end

end

Botliga.new.send_tip

