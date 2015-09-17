class SummonersController < ApplicationController
  def show
    @summoner = Summoner.find(params[:id])
    @teams = @summoner.teams
  end
end
