require 'net/http'

class Botliga

  def self.send_tip
    next_matches = [14008, 14009, 14010, 14011, 14012, 14013, 14014, 14015, 14016]
    next_matches.each do |match_id|
      send_result match_id, calculate_result
    end
  end

  private

  def self.calculate_result
    "#{2}:#{1}"
  end

  def self.send_result match_id, result
    token = 'sotbt8ndvud3c1vgpyyxgh29'
    http = Net::HTTP.new('botliga-11.de', 80)
    response, data = http.post('/api/guess', "match_id=#{match_id}&result=#{result}&token=#{token}")
    puts "#{response.code} #{data}"
  end

  send_tip

end
