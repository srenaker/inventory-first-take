# spec/factories/collections.rb

require_relative '../spec_helper'

FactoryGirl.define do
  uid = (rand() * 100).to_s
  
  factory :collection do |f|
    f.user_id uid
    f.item_type { Faker::Name.name }
    f.attr1 { Faker::Name.name }
    f.attr2 { Faker::Name.name }
    f.attr3 { Faker::Name.name }    
  end
end