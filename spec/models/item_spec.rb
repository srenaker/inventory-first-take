# spec/models/item_spec.rb
require 'spec_helper'

describe Item do
  it 'has a valid factory' do
    FactoryGirl.create(:item).should be_valid
  end
  
  it 'requires a user_id' do
    FactoryGirl.build(:item, user_id: nil).should_not be_valid
  end
  
  it 'requires a lastname' do
    FactoryGirl.build(:user, lastname: nil).should_not be_valid
  end
end