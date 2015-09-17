class Team < ActiveRecord::Base
  has_many :rosters
  has_many :summoners, through: :rosters
  
  validates :full_Id, presence: true, uniqueness: true
  validates :name, presence: true

end
