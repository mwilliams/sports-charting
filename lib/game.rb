require 'base'

module AYWT
  class Game < Base
    attr_accessor :id, :description, :sport, :teams, :time, :time_left, :points, :news, :date, :rationale
    
    def self.get_game_details(id)
      @game_hash = AYWT::Base.get_game_details(id)
      build_game_object_from_hash(@game_hash)
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
    
  end
end
