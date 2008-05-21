module GCharts
  class GoogleCharts
    # Builds a Google-o-Meter chart based on the overall score value for the game as defined by the users of the site
    # Parameters:
    # number - string or integer value between 0-100.  Example) 45 or "45"
    # Returns: A valid URL that renders a Google-o-Meter chart as a PNG image
    def self.build_google_o_meter_chart(number)
      "http://chart.apis.google.com/chart?chs=225x125&cht=gom&chd=t:#{number}"
    end
    
    # Builds a pie chart that displays the score of the game
    # Parameters:
    # home_team - string containing the home team name.  Example) Yankees
    # home_team_score - string or integer with the home teams current score  Example) 3 or "3"
    # away_team - string containing the away team name.  Example) Red Sox
    # away_team_score - string or integer with the away teams current score.  Example) 1 or "1"
    # Returns: A valid URL that renders a 3D Google Pie Chart as a PNG image
    def self.build_score_pie_chart(home_team, home_team_score, away_team, away_team_score)
      "http://chart.apis.google.com/chart?cht=p3&chd=t:#{home_team_score},#{away_team_score}&chs=500x200&chl=#{home_team}-#{home_team_score}|#{away_team}-#{away_team_score}"
    end
    
    # Builds a Google Map chart with the two states of the teams participating in the current game
    # Parameters:
    # home_team - a string that contains the two character representation of their state.  Example) NY
    # away_team - a string that contains the two character representation of their state.  Example) MA
    def self.build_map(home_team, away_team)
      # "http://chart.apis.google.com/chart?chs=350x200&cht=t&chtm=usa&chco=ffffff,ffffff,385E0F&chld=#{home_team}#{away_team}&chd=s:f9&chf=bg,s,eaf7fe"
     "http://chart.apis.google.com/chart?chs=350x200&cht=t&chtm=usa&chco=CCCCCC,CC0033,006600&chld=#{home_team}#{away_team}&chd=s:f9&chf=bg,s,ffffff"
    end
    
  end
end
