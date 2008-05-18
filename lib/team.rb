require 'base'

module AYWT
  class Team < Base
    attr_accessor :id, :city, :team_name
    
    def self.get_teams_for_sport(sport)
      @teams = []
      @details = AYWT::Base.get_teams_for_sport(sport)
      @details["teams"].each do |teams|
        teams["team"].each do |team|
          @team = AYWT::Team.new
          @team.id = team["id"]
          @team.city = team["city"]
          @team.team_name = team["name"]
          @teams << @team
        end
      end
      @teams
    end
    
  end
end
