class SummonersController < ApplicationController
  def show
    @summoner = Summoner.find(params[:id])
    @teams = @summoner.teams
  end

  def new
    @summoner = Summoner.new
  end

  def create
    name = summoner_params[:name]
    summoner_info = Riot.summoner_name(name)[name]
    params = {"riot_id" => summoner_info['id'], "name" => summoner_info['name']}
    if Summoner.exists?(riot_id: summoner_info['id'])
      summoner = Summoner.find_by(riot_id: summoner_info['id'])
      redirect_to summoner_path(summoner)
    else
      @summoner = Summoner.new(params)
      if @summoner.save
        flash[:notice] = 'summoner added'
        teams_array = Riot.team(params["riot_id"])[@summoner.riot_id.to_s]
        teams_array.each do |team|
          Team.make(team, @summoner)
        end
        redirect_to summoner_path(@summoner)
      else
        render :new
      end
    end
  end

  private
  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
