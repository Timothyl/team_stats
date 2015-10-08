class Riot
  include HTTParty
  debug_output $stdout
  default_params api_key: ENV["RIOT_API_KEY"]
  base_uri "https://na.api.pvp.net/api/lol/na"
  $stop_time = Time.now - 10

  def self.summoner_name name
    name = standardize(name)
    if all_letters_or_digits(name)
      response = get("/v1.4/summoner/by-name/#{name}")
      unless response.header.code == "200"
        return nil
      else
        return response
      end
    else
      return nil
    end
  end

  def self.summoner_id id
    response = get("/v1.4/summoner/#{id}")
  end

  def self.team id
    get("/v2.4/team/by-summoner/#{id}")
  end

  def self.match id
    unless (Time.now - $stop_time) < 10
      response = get("/v2.2/match/#{id}")
      unless response.header.code == "200"
        $stop_time = Time.now
        return nil
      else
        return response
      end
    else
      return nil
    end
  end

  def self.standardize name
    standard = name.downcase
    standard.gsub(/\s+/, "")
  end

  def self.all_letters_or_digits str
    str[/[a-zA-Z0-9]+/] == str
  end
end
