# spec/models/collection_spec.rb
require 'spec_helper'

describe Collection do
  it 'has a valid factory' do
    FactoryGirl.create(:collection).should be_valid
  end
  
  it 'requires a user_id' do
    FactoryGirl.build(:collection, user_id: nil).should_not be_valid
  end

  it 'requires an item_type' do
    FactoryGirl.build(:collection, item_type: nil).should_not be_valid
  end

  it 'requires an attribute' do
    FactoryGirl.build(:collection, attr1: nil).should_not be_valid
  end
  
  
end