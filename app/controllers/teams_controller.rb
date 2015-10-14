class TeamsController < ApplicationController
  def show
    @summoner = params[:summoner_id]
    @team = Team.find(params[:id])
    respond_to do |format|
      format.html do
        Match.get_info(@team)
      end
      format.json do
        summoners = @team.summoners.map { |s| s.name }
        physical = []
        magic = []
        trueDam = []
        gold = []

        @team.summoners.each do |s|
          physical << s.rosters.find_by(team: @team).avg_phys_damage.to_f
          magic << s.rosters.find_by(team: @team).avg_magic_damage.to_f
          trueDam << s.rosters.find_by(team: @team).avg_true_damage.to_f
          gold << s.rosters.find_by(team: @team).avg_gold
        end
        render json: [summoners, physical, magic, trueDam, gold]
      end
    end
  end
end
