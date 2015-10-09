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
    if Summoner.exists?(name: name)
      @summoner = Summoner.find_by(name: name)
    else
      summoner_info = Riot.summoner_name(name)
      if !summoner_info.nil?
        summoner_info = summoner_info[Riot.standardize(name)]
        params = { riot_id: summoner_info["id"], name: summoner_info["name"] }
        @summoner = Summoner.find_or_create_by(params)
        if @summoner.save
          flash[:notice] = "Welcome!"
        else
          @summoner = nil
        end
      end
    end
    if !@summoner.nil?
      teams_array = Riot.team(@summoner.riot_id)[@summoner.riot_id.to_s]
      if teams_array.nil?
        flash[:notice] = "No teams found for that summoner"
        render :new
      else
        Team.make(teams_array, @summoner)
        redirect_to summoner_path(@summoner)
      end
    elsif
      flash[:notice] = "Didn't recognize that summoner"
      @summoner = Summoner.new
      render :new
    end
  end

  private
  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
