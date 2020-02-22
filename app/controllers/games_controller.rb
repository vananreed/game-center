class GamesController < ApplicationController
  def index
    @games = Game.all
    @users_achievements = current_user.users_achievements
  end
end
