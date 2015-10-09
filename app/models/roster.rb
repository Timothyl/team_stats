class Roster < ActiveRecord::Base
  belongs_to :summoner
  belongs_to :team

  validates :summoner, presence: true
  validates :team, presence: true

  def self.make_connection(team, summoner, joindate)
    date = Time.at(joindate / 1000)
    Roster.find_or_create_by(summoner: summoner, team: team, joindate: date)
  end
end
