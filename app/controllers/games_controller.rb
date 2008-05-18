require 'are_you_watching_this'

class GamesController < ApplicationController

  def index
    @game_information = AYWT::AreYouWatchingThis.get_game
  end
end
