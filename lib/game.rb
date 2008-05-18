require 'base'

module AYWT
  class Game < Base
    attr_accessor :id, :description, :sport, :teams, :time, :time_left, :points, :news, :date, :rationale
    
    def self.get_game_details(id)
      @game = AYWT::Game.new 
      @teams = []
      @details = AYWT::Base.get_game_details(id)

      @details["games"].each do |games|
        p "break"
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
            p "break"
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
