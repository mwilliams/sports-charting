require 'team'
require 'game'
class SportsChartingController < ApplicationController

  def index
  end

  def teams
    @sport = params[:sport]
    @teams = AYWT::Team.get_teams_for_sport(@sport)
  end

  def games
    @team_id = params[:id]
    @games = AYWT::Game.get_games_for_team(@team_id)
  end

  def game
    @id = params[:id]
    @game = AYWT::Game.get_game_details(@id)
  end
end
