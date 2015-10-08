class Team < ActiveRecord::Base
  has_many :rosters
  has_many :summoners, through: :rosters
  has_many :matches

  validates :full_Id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :tag, presence: true

  def self.make(team_array, summoner)
    player_ids_to_query = []
    team_array.each do |t|
      roster = t["roster"]["memberList"]
      roster.each do |r|
        player_ids_to_query << r["playerId"]
      end
    end

    all_players = Summoner.add(player_ids_to_query)

    team_array.each do |t|
      new_team = Team.find_or_create_by(full_Id: t["fullId"],
        name: t["name"], tag: t["tag"])
      roster = t["roster"]["memberList"]
      roster.each do |player|
        i = all_players.index { |ap| ap.riot_id == player["playerId"] }
        summoner = all_players[i]
        Roster.make_connection(new_team, summoner)
      end
      t["matchHistory"].each do |m|
        match_id = m["gameId"]
        Match.make(match_id, new_team)
      end
    end
  end
end
