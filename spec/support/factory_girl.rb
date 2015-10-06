require "factory_girl_rails"
require "factory_girl"

FactoryGirl.define do
  factory :summoner do
    sequence(:name) { |n| "summoner#{n}" }
    riot_id n
  end
end
