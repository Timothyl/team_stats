class Team < ActiveRecord::Base
  has_many :rosters
  has_many :summoners, through: :rosters

  validates :full_Id, presence: true, uniqueness: true
  validates :name, presence: true

  def self.make(team, summoner)
    roster = team["roster"]["memberList"]
    new_team = Team.find_or_create_by(full_Id: team["fullId"],
                                  name: team["name"],
                                  tag: team["tag"])
    roster.each do |player|
      summoner = Summoner.add(player["playerId"])
      Roster.make_connection(new_team, summoner)
    end
  end
end
