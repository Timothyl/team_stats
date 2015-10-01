class Roster < ActiveRecord::Base
  belongs_to :summoner
  belongs_to :team

  validates :summoner, presence: true
  validates :team, presence: true

  def self.make_connection (team, summoner)
    Roster.find_or_create_by(summoner: summoner, team: team)
  end
end
