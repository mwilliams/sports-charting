module AYWT
  class Base
    
    AYWT_URL = 'http://areyouwatchingthis.com/api/'
 
    def self.get_teams_for_sport(sport)
      get_data("teams?sport=#{sport}")
    end   
    
    def self.get_games_for_team(team)
      get_data("games?teamID=#{team}")
    end
    
    def self.get_game_details(game_id)
      AYWT::Base.get_data("games?gameID=#{game_id}")
    end   
    
    private
    
    def self.get_data(endpoint)
      XmlSimple.xml_in(Net::HTTP.get_response(URI.parse([AYWT_URL,endpoint].join)).body)
    end
    
  end
end

