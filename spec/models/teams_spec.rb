require "rails_helper"

describe Team do
  describe "table" do
    it { should have_db_column(:full_Id).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:tag).of_type(:string) }
  end

  describe "associations" do
    it { should have_many(:summoners) }
  end

  describe "validations" do
    it { should validate_presence_of(:full_Id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tag) }
  end
end
