require 'test/unit'
require 'team'
require 'rubygems'
require 'xmlsimple'
require 'net/http'

class TeamUnitTest < Test::Unit::TestCase  
  def test_get_teams_for_sport
    @details = AYWT::Team.get_teams_for_sport("mlb")
    assert_kind_of Array, @details
    assert_kind_of AYWT::Team, @details.first
  end
  
end
