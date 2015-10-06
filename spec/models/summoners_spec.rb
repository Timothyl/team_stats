require "rails_helper"

describe Summoner do
  describe "table" do
    it { should have_db_column(:riot_id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
  end

  describe "associations" do
    it { should have_many(:teams) }
  end

  describe "validations" do
    it { should validate_presence_of(:riot_id) }
    it { should validate_presence_of(:name) }
  end
end
