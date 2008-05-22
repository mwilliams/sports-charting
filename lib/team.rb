require 'base'

module AYWT
  class Team < Base
    # Builds the setters and getters for this class's attributes
    attr_accessor :id, :city, :team_name
    
    # Retrieves a list of teams for a specific sport
    # Parameters:
    # sport - A string containing the sport acroynym.  Example) "nba" or "nfl"
    # Returns: An array of Team objects containing a list of teams for the specific sport
    def self.get_teams_for_sport(sport)
      @teams_hash = AYWT::Base.get_teams_for_sport(sport)
      build_teams_object_from_hash(@teams_hash)
    end
    
    private
    
    # Takes a hash of teams and builds an array of Team objects
    # Parameters:
    # hash - A hash of teams
    # Returns: An array of Team objects with their attributes set
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
