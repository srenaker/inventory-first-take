# spec/requests/collections_spec.rb
require 'spec_helper'

describe "Collections", :type => :request do
  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    request_login(@user.username, @user.password)
  end 
      
  it 'Adds a new collection' do
    item_type = Faker::Name.name 
    attr1 = Faker::Name.name 
    attr2 = Faker::Name.name 
    visit user_path(@user)

    expect {
      click_link 'New collection'
      fill_in 'collection_item_type', with: item_type
      fill_in 'collection_attr1', with: attr1
      fill_in 'collection_attr2', with: attr2
      click_button 'Create Collection'
    }.to change(Collection, :count).by(1)
    page.should have_content('Collection was successfully created.')
    
    within 'li' do
      page.should have_content item_type
    end  
  end
  
  
  
end
