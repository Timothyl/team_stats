class Roster < ActiveRecord::Base
  belongs_to :summoner
  belongs_to :team

  validates :summoner, presence: true
  validates :team, presence: true
end
