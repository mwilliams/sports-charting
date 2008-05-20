require File.dirname(__FILE__) + '/../test_helper'

class SportsChartingControllerTest < ActionController::TestCase
  # All tests are using valid ID's from AreYouWatchingThis.com as of
  # May 19th, 2008
  
  def test_index
    get :index
    assert_response :success
  end
  
  def test_teams
    get :teams, :sport => "mlb"
    assert_response :success
  end
  
  def test_games
    get :games, :id => "7073"
    assert_response :success
  end
  
  def test_game
    get :game, :id => "75664"
    assert_response :success
  end
  
  def test_a_team_with_no_games
    get :games, :id => "13312"
    assert_response :success
  end
  
  def test_team_route
    opts = {:controller => "sports_charting", :action => "teams", :sport => "mlb"}
    assert_generates "sports_charting/teams/mlb", opts
  end
  
  def test_games_route
    opts = {:controller => "sports_charting", :action => "games", :id => "5555"}
    assert_generates "sports_charting/games/5555", opts
  end
  
  def test_game_route
    opts = {:controller => "sports_charting", :action => "game", :id => "5555"}
    assert_generates "sports_charting/game/5555", opts
  end
  
end
