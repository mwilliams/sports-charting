module AYWT
  class Base
    
    AYWT_URL = 'http://areyouwatchingthis.com/api/games/'

    def self.get_games_for_sport(sport)
      get_data("?sport=#{sport}")
    end
    
    def self.get_game_details(game_id)
      AYWT::Base.get_data("?gameID=#{game_id}")
    end   
    
    private
    def self.get_data(endpoint)
      XmlSimple.xml_in(Net::HTTP.get_response(URI.parse([AYWT_URL,endpoint].join)).body)
    end
    
  end
end

