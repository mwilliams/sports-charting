# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

module GCharts
  class GoogleCharts
    def self.build_google_o_meter_chart(number)
      "http://chart.apis.google.com/chart?chs=225x125&cht=gom&chd=t:#{number}"
    end
    
    def self.build_score_pie_chart(home_team, home_team_score, away_team, away_team_score)
      "http://chart.apis.google.com/chart?cht=p3&chd=t:#{home_team_score},#{away_team_score}&chs=500x200&chl=#{home_team}-#{home_team_score}|#{away_team}-#{away_team_score}"
    end
    
    def self.build_map(home_team, away_team)
      "http://chart.apis.google.com/chart?chs=350x200&cht=t&chtm=usa&chco=ffffff,ffffff,385E0F&chld=#{home_team}#{away_team}&chd=s:f9&chf=bg,s,eaf7fe"
    end
    
  end
end
