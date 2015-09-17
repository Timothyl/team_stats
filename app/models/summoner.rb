class Summoner < ActiveRecord::Base
  has_many :rosters
  has_many :teams, through: :rosters

  validates :riot_id, presence: true, uniqueness: true
  validates :name, presence: true

end
