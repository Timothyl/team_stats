class TeamsController < ApplicationController
  def show
    @summoner = params[:summoner_id]
    @team = Team.find(params[:id])

    Match.get_info(@team)

    @team.rosters.each do |roster|
      summ_id = roster.summoner.riot_id
      roster.kills = 0
      roster.assists = 0
      roster.deaths = 0
      roster.save
      @team.matches.each do |match|
        unless match.info == nil
          summ_list = match.info["participantIdentities"]
          i = summ_list.index { |part| part["player"]["summonerId"] == summ_id }
          unless i == nil
            summ_part_id = summ_list[i]["participantId"]
            summ_info = match.info["participants"][summ_part_id - 1]
            roster.kills = summ_info["stats"]["kills"] + roster.kills
            roster.deaths = summ_info["stats"]["deaths"] + roster.deaths
            roster.assists = summ_info["stats"]["assists"] + roster.assists
            roster.save
          end
        end
      end
    end
  end
end
