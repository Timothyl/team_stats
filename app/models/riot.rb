class Riot
  include HTTParty
  default_params :api_key => '82ced787-5473-4e7f-938f-c35a1f628ade'
  base_uri 'https://na.api.pvp.net/api/lol/na'

  def self.summoner_name name
    get("/v1.4/summoner/by-name/#{name}")
  end

  def self.team id
    get("/v2.4/team/by-summoner/#{id}")
  end

end
