class Roster < ActiveRecord::Base
  belongs_to :summoner
  belongs_to :team

  validates :summoner, presence: true
  validates :team, presence: true

  def self.make_connection (team, summoner)
    Roster.create(summoner: summoner, team: team)
  end
end
