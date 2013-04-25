# spec/models/item_spec.rb
require 'spec_helper'

describe Item do
  it 'has a valid factory' do
    FactoryGirl.create(:item).should be_valid
  end
  
  it 'requires a user_id' do
    FactoryGirl.build(:item, user_id: nil).should_not be_valid
  end
  
  it 'requires a collection_id' do
    FactoryGirl.build(:item, collection_id: nil).should_not be_valid
  end

  it 'requires an item_type' do
    FactoryGirl.build(:item, item_type: nil).should_not be_valid
  end

  it 'requires an attribute' do
    FactoryGirl.build(:item, attr1: nil).should_not be_valid
  end
  
  
end