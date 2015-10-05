class Team < ActiveRecord::Base
  has_many :rosters
  has_many :summoners, through: :rosters

  validates :full_Id, presence: true, uniqueness: true
  validates :name, presence: true

  def self.make(team_array, summoner)
    player_ids_to_query = []
    team_array.each do |t|
      roster = t["roster"]["memberList"]
      roster.each do |r|
        player_ids_to_query << r["playerId"]
      end
    end

    File.open("temp.json", "'"w"'") do |f|
      f.write(JSON.pretty_generate(player_ids_to_query))
    end

    all_players = Summoner.add(player_ids_to_query)
    team_array.each do |t|
      new_team = Team.find_or_create_by(full_Id: t["fullId"],
        name: t["name"], tag: t["tag"])
      roster = t["roster"]["memberList"]
      roster.each do |player|
        i = all_players.index { |ap| ap.riot_id == player["'"playerId"'"] }
        summoner = all_players[i]
        Roster.make_connection(new_team, summoner)
      end
    end
  end
end
