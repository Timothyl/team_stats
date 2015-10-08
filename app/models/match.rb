class Match < ActiveRecord::Base
  belongs_to :team

  validates :match_id, presence: true

  def self.make(match_id, team)
    unless Match.exists?(match_id: match_id)
      Match.create!(team: team, match_id: match_id)
    end
  end

  def self.get_info team
    team.matches.each do |m|
      if m.info == nil
        m.info = Riot.match(m.match_id)
        m.save
      end
    end
  end
end
