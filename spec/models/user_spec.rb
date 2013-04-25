# spec/models/user_spec.rb
require 'spec_helper'

describe User do
  it 'has a valid factory' do
    FactoryGirl.create(:user).should be_valid
  end
  
  it 'requires a firstname' do
    FactoryGirl.build(:user, firstname: nil).should_not be_valid
  end
  
  it 'requires a lastname' do
    FactoryGirl.build(:user, lastname: nil).should_not be_valid
  end

  it 'requires a username' do
    FactoryGirl.build(:user, username: nil).should_not be_valid
  end
  
  it 'requires a password' do
    FactoryGirl.build(:user, lastname: nil).should_not be_valid
  end

  it 'requires a password of at least 4 characters' do
    FactoryGirl.build(:user, password: 'xxx').should_not be_valid
  end
  
  it 'requires that the username be unique' do
    uname = Faker::Internet.user_name
    FactoryGirl.create(:user, username: uname)
    FactoryGirl.build(:user, username: uname).should_not be_valid    
  end
  
end