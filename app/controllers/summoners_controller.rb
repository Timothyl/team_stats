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
      summoner_info = Riot.summoner_name(name)[Riot.standardize(name)]
      params = { riot_id: summoner_info["id"], name: summoner_info["name"] }
      @summoner = Summoner.new(params)
      if @summoner.save
        flash[:notice] = "Welcome!"
      else
        flash[:notice] = "Bad summoner name"
      end
    end
    if !@summoner.nil?
      teams_array = Riot.team(@summoner.riot_id)[@summoner.riot_id.to_s]
      File.open("temp.json", "w") do |f|
        f.write(JSON.pretty_generate(teams_array))
      end

      Team.make(teams_array, @summoner)
      redirect_to summoner_path(@summoner)
    elsif
      render :new
    end
  end

  private
  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
