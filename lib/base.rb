module AYWT
  class Base
    
    # Main URL that every HTTP GET request is made from
    AYWT_URL = 'http://areyouwatchingthis.com/api/'
 
    # Crafts the endpoint to be added to AYWT_URL and calls the get_data function with that endpoint as the parameter.
    # This function is used to retrieve the list of teams for a specific sport
    # Parameters:
    # sport - A string containing the sport acroynym.  Example) "nba" or "nfl"
    # Returns: A Hash containing a list of teams for the specific sport
    def self.get_teams_for_sport(sport)
      get_data("teams?sport=#{sport}")
    end   
    
    # Crafts the endpoint to be added to AYWT_URL and calls the get_data function with that endpoint as the parameter.
    # This function is used to retrieve the list of games for a specific team
    # Parameters:
    # team - An integer containing the ID of a specific team.  Example) 7541
    # Returns: A Hash containing a list of games for the associated team
    def self.get_games_for_team(team)
      get_data("games?teamID=#{team}")
    end
    
    # Crafts the endpoint to be added to AYWT_URL and calls the get_data function with that endpoint as the parameter.
    # This function is used to retrieve the details of a specific game
    # Parameters:
    # game_id - An integer containing the ID of a specific game.  Example) 6214
    # Returns: A Hash containing a list of teams for the specific sport
    def self.get_game_details(game_id)
      AYWT::Base.get_data("games?gameID=#{game_id}")
    end   
    
    private
    
    # Builds the requested URL, makes an HTTP GET request against that URL and uses the XML Simple library to turn the 
    # returned XML into a Ruby Hash
    # Parameters:
    # endpoint - The specific API call 
    # Returns: A Hash containing the data from the requesting method
    def self.get_data(endpoint)
      XmlSimple.xml_in(Net::HTTP.get_response(URI.parse([AYWT_URL,endpoint].join)).body)
    end
    
  end
end

