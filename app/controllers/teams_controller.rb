class TeamsController < ApplicationController
  def show
    @summoner = params[:summoner_id]
    @team = Team.find(params[:id])
  end
end
