# spec/factories/items.rb

require 'spec_helper'

FactoryGirl.define do
  uid = (rand() * 100).to_s
  cid = (rand() * 100).to_s
  
  factory :item do |f|
    f.user_id uid
    f.collection_id cid
    f.item_type { Faker::Name.name }
    f.attr1 { Faker::Name.name }
    f.attr2 { Faker::Name.name }
    f.attr3 { Faker::Name.name }    
  end
end