require 'base'

module AYWT
  class Game < Base
    attr_accessor :id, :description, :sport, :teams, :time, :time_left, :points, :news, :date, :rationale
    
    def self.get_game_details(game_id)
      @game_hash = AYWT::Base.get_game_details(game_id)
      build_game_object_from_hash(@game_hash)
    end
    
    def self.get_games_for_team(team_id)
      @games_hash = AYWT::Base.get_games_for_team(team_id)
      build_games_object_from_hash(@games_hash)
    end

    private
    
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
