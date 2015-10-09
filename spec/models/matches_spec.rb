require "rails_helper"

describe Match do
  describe "table" do
    it { should have_db_column(:team_id).of_type(:integer) }
    it { should have_db_column(:match_id).of_type(:integer) }
    it { should have_db_column(:info).of_type(:json) }
  end

  describe "associations" do
    it { should belong_to(:team) }
  end

  describe "validations" do
    it { should validate_presence_of(:match_id) }
    it { should validate_presence_of(:team_id) }
  end
end
