class Summoner < ActiveRecord::Base
  has_many :rosters
  has_many :teams, through: :rosters

  validates :riot_id, presence: true, uniqueness: true
  validates :name, presence: true

  def self.add id
    if Summoner.exists?(riot_id: id)
      return Summoner.find_by(riot_id: id)
    else
      summoner = Riot.summoner_id(id)
      summoner = summoner[id.to_s]
      return Summoner.new(riot_id: summoner["id"], name: summoner["name"])
    end
  end

end
