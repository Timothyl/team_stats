class SummonersController < ApplicationController
  def show
    @summoner = Question.find(params[:id])
  end
end
