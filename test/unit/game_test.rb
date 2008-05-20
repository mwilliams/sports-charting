require 'test/unit'
require 'game'
require 'rubygems'
require 'xmlsimple'
require 'net/http'

class GameUnitTest < Test::Unit::TestCase
  # All tests are using ID's of a known game ID that is good as of
  # May 19th, 2008
  
  def test_get_game_details
    @details = AYWT::Game.get_game_details(75664)
    assert_kind_of AYWT::Game, @details
    assert_equal("75664", @details.id) 
    assert_equal(2, @details.teams.length)
  end
  
  def test_get_games_for_teams
    @details = AYWT::Game.get_games_for_team(7073)
    assert_kind_of Array, @details
    assert_equal(12, @details.length)
  end
  
end
