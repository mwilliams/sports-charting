require 'base'

module AYWT
  class Team < Base
    attr_accessor :id, :city, :team_name
    
    def self.get_teams_for_sport(sport)
      @teams_hash = AYWT::Base.get_teams_for_sport(sport)
      build_teams_object_from_hash(@teams_hash)
    end
    
    private
    
    def self.build_teams_object_from_hash(hash)
      @teams = []
      hash["teams"].each do |teams|
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
