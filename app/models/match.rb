class Match < ActiveRecord::Base
  belongs_to :team

  validates :match_id, presence: true
  validates :team_id, presence: true

  def self.make(match_id, team)
    unless Match.exists?(match_id: match_id)
      Match.create!(team: team, match_id: match_id)
    end
  end

  def self.get_info team
    team.matches.each do |m|
      if m.info == nil
        m.info = Riot.match(m.match_id)
        m.save
      end
    end

    team.rosters.each do |roster|
      summ_id = roster.summoner.riot_id
      roster.kills = 0
      roster.assists = 0
      roster.deaths = 0
      roster.total_percent_damage_dealt = 0
      roster.total_number_of_games = 0
      roster.avg_percent_damage = 0
      roster.save
      team.matches.each do |match|
        unless match.info == nil
          summ_list = match.info["participantIdentities"]
          i = summ_list.index { |part| part["player"]["summonerId"] == summ_id }
          unless i == nil
            summ_part_id = summ_list[i]["participantId"]
            summ_info = match.info["participants"][summ_part_id - 1]
            summ_team = summ_info["teamId"]
            roster.kills = summ_info["stats"]["kills"] + roster.kills
            roster.deaths = summ_info["stats"]["deaths"] + roster.deaths
            roster.assists = summ_info["stats"]["assists"] + roster.assists
            summ_damage_dealt = summ_info["stats"]["totalDamageDealtToChampions"]
            team_damage_dealt = 0
            match.info["participants"].each do |par|
              if par["teamId"] == summ_team
                team_damage_dealt += par["stats"]["totalDamageDealtToChampions"]
              end
            end
            perc_damage = (summ_damage_dealt / team_damage_dealt.to_f).round(2)
            roster.total_percent_damage_dealt += perc_damage * 100
            roster.total_number_of_games += 1
            roster.save
          end
        end
      end
      unless roster.total_number_of_games == 0
        final = roster.total_percent_damage_dealt / roster.total_number_of_games
        roster.avg_percent_damage = final
        roster.save
      end
    end



  end
end
