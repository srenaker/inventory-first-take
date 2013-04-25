# spec/factories/items.rb

require 'spec_helper'

FactoryGirl.define do
  factory :item do |f|
    f.user_id (rand() * 100).to_s
    f.collection_id (rand() * 100).to_s
    f.item_type { Faker::Name.name }
    f.attr1 { Faker::Name.name }
    f.attr2 { Faker::Name.name }
    f.attr3 { Faker::Name.name }    
  end
end