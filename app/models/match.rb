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
      if m.info == nil || m.info[0] == "does not exist"
        m.info = Riot.match(m.match_id)
        m.save
      end
    end

    team.rosters.each do |roster|
      summ_id = roster.summoner.riot_id
      roster.kills = 0
      roster.assists = 0
      roster.deaths = 0
      roster.total_number_of_games = 0
      roster.total_percent_damage_dealt = 0
      roster.total_percent_physical_damage = 0
      roster.total_percent_magic_damage = 0
      roster.total_percent_true_damage = 0
      roster.avg_percent_damage = 0
      roster.save
      team.matches.each do |match|
        unless match.info == nil || match.info[0] == "does not exist"
          summ_list = match.info["participantIdentities"]
          i = summ_list.index { |part| part["player"]["summonerId"] == summ_id }
          unless i == nil
            summ_part_id = summ_list[i]["participantId"]
            summ_info = match.info["participants"][summ_part_id - 1]
            summ_team = summ_info["teamId"]
            roster.kills = summ_info["stats"]["kills"] + roster.kills
            roster.deaths = summ_info["stats"]["deaths"] + roster.deaths
            roster.assists = summ_info["stats"]["assists"] + roster.assists
            roster.save
            sum_damage_dealt = summ_info["stats"]["totalDamageDealtToChampions"]
            sum_physical_dealt = summ_info["stats"]["physicalDamageDealtToChampions"]
            sum_magic_dealt = summ_info["stats"]["magicDamageDealtToChampions"]
            sum_true_dealt = summ_info["stats"]["trueDamageDealtToChampions"]
            team_damage_dealt = 0
            team_physical_dealt = 0
            team_magic_dealt = 0
            team_true_dealt = 0
            match.info["participants"].each do |par|
              if par["teamId"] == summ_team
                team_damage_dealt += par["stats"]["totalDamageDealtToChampions"]
              end
            end
            perc_damage = (sum_damage_dealt / team_damage_dealt.to_f).round(3)
            perc_physical = (sum_physical_dealt / sum_damage_dealt.to_f).round(3)
            perc_magic = (sum_magic_dealt / sum_damage_dealt.to_f).round(3)
            perc_true = (sum_true_dealt / sum_damage_dealt.to_f).round(3)
            perc_physical = perc_physical * perc_damage
            perc_magic = perc_magic * perc_damage
            perc_true = perc_true * perc_damage
            roster.total_percent_damage_dealt += (perc_damage * 100).round(1)
            roster.total_percent_physical_damage += (perc_physical * 100).round(1)
            roster.total_percent_magic_damage += (perc_magic * 100).round(1)
            roster.total_percent_true_damage += (perc_true * 100).round(1)
            roster.total_number_of_games += 1
            roster.save
          end
        end
      end
      unless roster.total_number_of_games == 0
        final = roster.total_percent_damage_dealt / roster.total_number_of_games
        final_phys = (roster.total_percent_physical_damage / roster.total_number_of_games).round(1)
        final_magic = (roster.total_percent_magic_damage / roster.total_number_of_games).round(1)
        final_true = (roster.total_percent_true_damage / roster.total_number_of_games).round(1)
        roster.avg_percent_damage = final
        roster.avg_phys_damage = final_phys
        roster.avg_magic_damage = final_magic
        roster.avg_true_damage = final_true
        roster.save
      end
    end
  end
end
