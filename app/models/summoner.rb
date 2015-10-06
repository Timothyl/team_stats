class Summoner < ActiveRecord::Base
  has_many :rosters
  has_many :teams, through: :rosters

  validates :riot_id, presence: true, uniqueness: true
  validates :name, presence: true

  def self.add id_array
    all_summoners = {}
    split = id_array.each_slice(39).to_a
    split.each do |array|
      id_list = ""
      array.each do |id|
        id_list << id.to_s << ","
      end
      all_summoners.merge!(Riot.summoner_id(id_list))
    end
    File.open("temp.json", "w") do |f|
      f.write(JSON.pretty_generate(all_summoners))
    end
    player_list_to_return = []
    all_summoners.each do |_id, s|
      player = Summoner.find_or_create_by(riot_id: s["id"], name: s["name"])
      player_list_to_return << player
    end
    return player_list_to_return
  end
end
