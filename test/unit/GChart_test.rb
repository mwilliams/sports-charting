require 'test/unit'
require 'google_charts'
require 'rubygems'
require 'xmlsimple'
require 'net/http'

class GChartUnitTest < Test::Unit::TestCase
  
  def test_build_google_o_meter_chart
    @chart = GCharts::GoogleCharts.build_google_o_meter_chart(50, "test")
    assert_kind_of String, @chart
    assert_equal("http://chart.apis.google.com/chart?chs=225x125&cht=gom&chd=t:50&chl=test", @chart)
  end
  
  def test_build_score_pie_chart
    @chart = GCharts::GoogleCharts.build_score_pie_chart("Yankees", "5", "Red Sox", "2")
    assert_kind_of String, @chart
    assert_equal("http://chart.apis.google.com/chart?cht=p3&chd=t:5,2&chs=500x200&chl=Yankees-5|Red Sox-2", @chart)  
  end
  
  def test_build_map
    @map = GCharts::GoogleCharts.build_map("NY","FL")
    assert_kind_of String, @map
    assert_equal("http://chart.apis.google.com/chart?chs=350x200&cht=t&chtm=usa&chco=CCCCCC,CC0033,006600&chld=NYFL&chd=s:f9&chf=bg,s,ffffff", @map)
  end
end
