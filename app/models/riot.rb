class Riot
  include HTTParty
  debug_output $stdout
  default_params api_key: ENV["RIOT_API_KEY"]
  base_uri "https://na.api.pvp.net/api/lol/na"

  def self.summoner_name name
    get("/v1.4/summoner/by-name/#{name}")
  end

  def self.summoner_id id
    get("/v1.4/summoner/#{id}")
  end

  def self.team id
    get("/v2.4/team/by-summoner/#{id}")
  end

  def self.standardize name
    standard = name.downcase
    standard = standard.gsub(/\s+/, "")
  end
end
