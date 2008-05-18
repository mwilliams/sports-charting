require 'base'
module AYWT
  class Team < Base
    attr_accessor :id, :city, :team_name
    
    def get_teams_for_sport(sport)
      @teams = []
      @details = AYWT::Base.get_teams_for_sport(sport)
      @details["teams"].each do |teams|
        @team = AYWT::Team.new
        teams["team"].each do |team|
          @team.id = team["id"]
          @team.city = team["city"]
          @team.team_name = team["name"]
        end
        @teams << @team
      end
      @teams
    end
    
  end
end
