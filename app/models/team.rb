class Team < ActiveRecord::Base
  has_many :rosters
  has_many :summoners, through: :rosters

  validates :full_Id, presence: true, uniqueness: true
  validates :name, presence: true

  def self.make(team, summoner)
    team = Team.create({"full_Id" => team["fullId"], "name" => team["name"], "tag" => team["tag"]})
    Roster.make_connection(team, summoner)
  end
end
