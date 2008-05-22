require 'base'

module AYWT
  class Game < Base
    # Builds setters/getters for attributes of this class
    attr_accessor :id, :description, :sport, :teams, :time, :time_left, :points, :news, :date, :rationale
    
    # Retrieves and builds a Game object with details of an event
    # Parameters:
    # game_id - The ID of the specified game
    # Returns: A Game object with information on the event
    def self.get_game_details(game_id)
      @game_hash = AYWT::Base.get_game_details(game_id)
      build_game_object_from_hash(@game_hash)
    end
    
    # This function retrieves a list of games associated with a given team
    # Parameters:
    # team_id - The ID of the selected team
    # Returns: An array of Game objects associated with a given team
    def self.get_games_for_team(team_id)
      @games_hash = AYWT::Base.get_games_for_team(team_id)
      unless @games_hash["games"][0]["count"] == "0"
        build_games_object_from_hash(@games_hash)
      else
        nil
      end
    end

    private
    
    
    # Takes a hash containing game data and crafts a Game object with the attributes
    # appropriately set
    # Parameters:
    # hash - A hash containing game data
    # Returns: A Game object with attributes associated with the event
    def self.build_game_object_from_hash(hash)
      @game = AYWT::Game.new
      @teams = []
      hash["games"].each do |games|
        games["game"].each do |game|
          @game.id = game["id"]
          @game.time = game["time"]
          @game.time_left = game["timeLeft"]
          @game.date = game["date"]
          @game.sport = game["sport"]
          @game.points = game["points"]
          @game.news = game["news"]
          @game.rationale = game["rationale"]
          game["teams"].each do |teams|
            teams["team"].each do |team|
              @teams << team
            end
            @game.teams = @teams
          end
        end
      end
      @game  
    end   
    
    # Builds an array of Game objects that contain information on upcoming games
    # for a specific team
    # Parameters:
    # hash - A hash containing a list of games associated with a team
    # Returns: An array of game objects with information of each of the teams
    # games
    def self.build_games_object_from_hash(hash)
      @games = []
      hash["games"].each do |games|
        games["game"].each do |game|
          @game = AYWT::Game.new  
          @teams = []          
          @game.id = game["id"]
          @game.date = game["date"]
          @game.time = game["time"]
          game["teams"].each do |teams|
            teams["team"].each do |team|
              @teams << team
            end
            @game.teams = @teams
          end
          @games << @game
          @teams = nil
        end
      end
      @games
    end
  end
end
