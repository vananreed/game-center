class PlaythroughsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    current_user.playthroughs.create!(game: game)
    redirect_to root_path
  end
end
