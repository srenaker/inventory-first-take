# spec/factories/users.rb

require 'spec_helper'

FactoryGirl.define do
  factory :user do |f|
    f.firstname { Faker::Name.first_name }
    f.lastname { Faker::Name.last_name }
    f.username { Faker::Internet.user_name }
    f.password 'test'
  end
end