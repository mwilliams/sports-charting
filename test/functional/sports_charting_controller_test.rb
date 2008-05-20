require File.dirname(__FILE__) + '/../test_helper'

class SportsChartingControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end
  
  def test_teams
    get :teams, :sport => "mlb"
    assert_response :success    
  end
  
  def test_games
    # ID: 7073 is for the NY Yankees
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
  
end
