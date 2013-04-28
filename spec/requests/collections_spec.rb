# spec/requests/collections_spec.rb
require 'spec_helper'

describe "Collections", :type => :request do
  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
  end
      
  it 'Adds a new collection' do
    item_type = Faker::Name.name 
    attr1 = Faker::Name.name 
    attr2 = Faker::Name.name 
    visit user_path(@user)
    # puts page.body

    expect {
      click_link 'New collection'
      fill_in 'item_type', with: item_type
      fill_in 'attr1', with: attr1
      fill_in 'attr2', with: attr2
      click_button 'Create Collection'
    }.to change(User, :count).by(1)
    page.should have_content('Collection was successfully created.')
    
    within 'li' do
      page.should have_content item_type
    end  
    
  end
  
end
