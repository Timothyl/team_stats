class TeamsController < ApplicationController
  def show
    @summoner = params[:summoner_id]
    @team = Team.find(params[:id])
    respond_to do |format|
      format.html do
        Match.get_info(@team)
      end
      format.json do
        summoners = @team.summoners.map{ |s| s.name }
        percents = @team.summoners.map{ |s| s.rosters.find_by(team: @team).avg_percent_damage }
        render json: [summoners, percents]
      end
    end
  end
end
