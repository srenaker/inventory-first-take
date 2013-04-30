# spec/requests/items_spec.rb
require 'spec_helper'

describe "Items", :type => :request do
  
  before :each do
    DatabaseCleaner.clean
  end
  
  it 'creates a new item' do
    attr1 = Faker::Name.name
    attr2 = Faker::Name.name
    attr3 = Faker::Name.name        
    user = FactoryGirl.create(:user)
    request_login(user.username, user.password)
    coll = FactoryGirl.create(:collection, user_id: user.id)
    visit "/items/new?collection_id=#{coll.id}"

    expect {
      fill_in 'item_attr1', with: attr1
      fill_in 'item_attr2', with: attr2
      fill_in 'item_attr3', with: attr3
      click_button "Create Item"
    }.to change(Item, :count).by(1)
    
    page.should have_content("Item was successfully created.")
    page.should have_content(attr1)
    page.should have_content(attr2)
    page.should have_content(attr3)        
  end
  
  it 'deletes an item', js: true do
    user = FactoryGirl.create(:user)
    request_login(user.username, user.password)
    coll = FactoryGirl.create(:collection, user_id: user.id)
    item = FactoryGirl.create(:item, user_id: user.id, collection_id: coll.id)
    
    visit "/collections/#{coll.id}"
    page.should have_content(coll.item_type)
    expect {
      find("img.delete_item").click
      page.driver.browser.switch_to.alert.accept
    }.to change(Item, :count).by(-1)
    page.should have_content("Item was successfully deleted.")
  end
  
  
end