class PlaythroughsController < ApplicationController
  def create
    game = Game.find(params[:game_id])
    playthrough = current_user.playthroughs.create!(game: game)

    flash[:notice] = "Congratulations, you scored #{playthrough.score} in #{game.name}"
    redirect_to root_path
  end
end
