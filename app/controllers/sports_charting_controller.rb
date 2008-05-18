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
  end

  def game
    @id = params[:id]
    @game = AYWT::Game.get_game_details(@id)
  end
end
