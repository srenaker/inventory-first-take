# spec/factories/users.rb

require 'spec_helper'

FactoryGirl.define do
  pw = (rand() * 100).to_s

  factory :user do |f|
    f.firstname { Faker::Name.first_name }
    f.lastname { Faker::Name.last_name }
    f.username { Faker::Internet.user_name }
    f.password pw
  end
end