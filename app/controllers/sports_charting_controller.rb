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
    @team_hash = {
      "13375" => "AZ", # Diamondbacks
      "13376" => "GA", # Braves
      "7065" => "MD", # Orioles
      "7066" => "MA", # Red Sox
      "13377" => "IL", # Cubs
      "7067" => "IL", # White Sox
      "13378" => "OH", # Reds
      "7068" => "OH", # Indians
      "13379" => "CO",# Rockies
      "7069" => "MI", # Tigers
      "13380" => "FL", # Marlins
      "13381" => "TX", # Astros
      "7070" => "MO", # Royals
      "13382" => "CA", # Dodgers
      "7071" => "CA", # Angels
      "13383" => "WI", # Brewers
      "7072" => "MN", # Twins
      "7073" => "NY", # Yankees
      "13384" => "NY",# Mets
      "7074" => "CA", # Athletics
      "13385" => "PA", # Phillies
      "13386" => "PA", # Pirates
      "13387" => "CA", # Padres
      "13388" => "CA", # Giants
      "7075" => "FL", # Mariners
      "13389" => "MS", # Cardinals
      "7076" => "FL", # Rays
      "7077" => "TX", # Rangers
      "7078" => "", # Blue Jays
      "13390" => "VA"  # Nationals
    }
    @id = params[:id]
    @game = AYWT::Game.get_game_details(@id)
    @away_team = @game.teams[0]["name"]
    @away_team_id = @game.teams[0]["id"]
    @home_team = @game.teams[1]["name"]
    @home_team_id = @game.teams[1]["id"]
    @game.teams[0]["score"] ? @away_team_score = @game.teams[0]["score"] : @away_team_score = "0"
    @game.teams[1]["score"] ? @home_team_score = @game.teams[1]["score"] : @home_team_score = "0"
    @game_score_pie_chart = GCharts::GoogleCharts.build_score_pie_chart(@home_team, @home_team_score, @away_team, @away_team_score)
    @game_points_meter = GCharts::GoogleCharts.build_google_o_meter_chart(@game.points[0]["content"])
    @game_map = GCharts::GoogleCharts.build_map(@team_hash[@home_team_id],@team_hash[@away_team_id])
  end
end
