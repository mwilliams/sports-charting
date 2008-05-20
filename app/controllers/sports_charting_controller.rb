require 'team'
require 'game'
require 'google_charts'
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
    @away_team = @game.teams[0]["name"]
    @home_team = @game.teams[1]["name"]
    @game.teams[0]["score"] ? @away_team_score = @game.teams[0]["score"] : @away_team_score = "0"
    @game.teams[1]["score"] ? @home_team_score = @game.teams[1]["score"] : @home_team_score = "0"
    @game_score_pie_chart = GCharts::GoogleCharts.build_score_pie_chart(@home_team, @home_team_score, @away_team, @away_team_score)
    @game_points_meter = GCharts::GoogleCharts.build_google_o_meter_chart(@game.points[0]["content"])
    @game_map = GCharts::GoogleCharts.build_map("NY","FL")
  end
end
