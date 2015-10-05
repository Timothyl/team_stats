class SummonersController < ApplicationController
  def show
    @summoner = Summoner.find(params[:id])
    @teams = @summoner.teams
  end

  def new
    @summoner = Summoner.new
  end

  def create
    ## no need to standardize names, unless for mapping purposes
    name = summoner_params[:name]
    # stand_name = Riot.standardize(summoner_params[:name])
    if Summoner.exists?(name: name)
      @summoner = Summoner.find_by(name: name)
    else
      summoner_info = Riot.summoner_name(name)[Riot.standardize(name)]
      params = {riot_id: summoner_info["id"], name: summoner_info["name"]}
      @summoner = Summoner.new(params)
      if @summoner.save
        flash[:notice] = "Welcome!"
      else
        flash[:notice] = "Bad summoner name"
      end
    end

    if @summoner.id != nil
      teams_array = Riot.team(@summoner.riot_id)[@summoner.riot_id.to_s]
      File.open('temp.json', 'w') do |f|
        f.write(JSON.pretty_generate(teams_array))
      end

      Team.make(teams_array, @summoner)
      binding.pry
      redirect_to summoner_path(@summoner)
    elsif
      render :new
    end

  end
  #
  #   if Summoner.exists?(riot_id: summoner_info["id"])
  #     summoner = Summoner.find_by(riot_id: summoner_info["id"])
  #     redirect_to summoner_path(summoner)
  #     # if summoner is in db already doesnt check for new teams
  #   else
  #     @summoner = Summoner.new(params)
  #     if @summoner.save
  #       flash[:notice] = "summoner added"
  #       teams_array = Riot.team(params["riot_id"])[@summoner.riot_id.to_s]
  #
  #       teams_array.each do |team|
  #         Team.make(team, @summoner)
  #       end
  #       redirect_to summoner_path(@summoner)
  #     else
  #       render :new
  #     end
  #   end
  # end

  private
  def summoner_params
    params.require(:summoner).permit(:name)
  end
end
