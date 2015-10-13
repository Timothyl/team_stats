require "rails_helper"

describe Roster do
  describe "table" do
    it { should have_db_column(:summoner_id).of_type(:integer) }
    it { should have_db_column(:team_id).of_type(:integer) }
    it { should have_db_column(:kills).of_type(:integer) }
    it { should have_db_column(:deaths).of_type(:integer) }
    it { should have_db_column(:assists).of_type(:integer) }
    it { should have_db_column(:joindate).of_type(:datetime) }
    it { should have_db_column(:total_percent_damage_dealt).of_type(:decimal) }
    it { should have_db_column(:total_number_of_games).of_type(:integer) }
    it { should have_db_column(:avg_percent_damage).of_type(:decimal) }
    it { should have_db_column(:total_percent_magic_damage).of_type(:decimal) }
    it { should have_db_column(:total_percent_physical_damage).of_type(:decimal) }
    it { should have_db_column(:total_percent_true_damage).of_type(:decimal) }
    it { should have_db_column(:avg_phys_damage).of_type(:decimal) }
    it { should have_db_column(:avg_magic_damage).of_type(:decimal) }
    it { should have_db_column(:avg_true_damage).of_type(:decimal) }

  end

  describe "associations" do
    it { should belong_to(:team) }
    it { should belong_to(:summoner) }
  end

  describe "validations" do
    it { should validate_presence_of(:summoner_id) }
    it { should validate_presence_of(:team_id) }
  end
end
