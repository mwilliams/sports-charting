require 'base'
require 'game'
require 'team'
 
class GamesController < ApplicationController
 
  def index
    @game = AYWT::Team.get_teams_for_sport("mlb")
    p 'break'
  end
end
 