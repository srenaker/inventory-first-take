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
    
    within('li') { page.should have_content(item_type) }
  end
  
  it 'fails to create a collection with no item_type or first attribute' do
    visit '/collections/new'
    click_button 'Create Collection'
    page.should have_content("2 errors prohibited this collection from being saved:")
  end
  
  it 'deletes a collection', js: true do
    coll = FactoryGirl.create(:collection, user_id: @user.id)
    visit "/collections/#{coll.id}"
    expect {
      click_button 'Delete collection'
      page.driver.browser.switch_to.alert.accept
    }.to change(Collection, :count).by(-1)
    
    page.should have_content("Collection was successfully deleted.")    
  end
  
  it 'does not delete a collection if user does not click accept in alert box confirm', js: true do
    coll = FactoryGirl.create(:collection, user_id: @user.id)
    visit "/collections/#{coll.id}"
    expect {
      click_button 'Delete collection'
      page.driver.browser.switch_to.alert.dismiss
    }.to change(Collection, :count).by(0)
  end
  
  describe 'Search' do
     
     before :each do
       @coll = FactoryGirl.create(:collection, user_id: @user.id)
       @item = FactoryGirl.create(:item, user_id: @user.id, collection_id: @coll.id)
       visit "/collections/#{@coll.id}"
     end
   
     it 'finds an item with search' do
       fill_in 'search_term', with: @item.attr1
       click_button 'Search'
       page.should have_content("Search term: #{@item.attr1}") 
       within('p') { page.should have_content("1 item found.") }
     end
   
     it 'works for case-insensitive terms' do
       lowercase = @item.attr1.downcase
       fill_in 'search_term', with: lowercase
       click_button 'Search'
       page.should have_content("Search term: #{lowercase}") 
       within('p') { page.should have_content("1 item found.") }
       page.should have_content(@item.attr1) 
     end
   
     it 'fails to find a nonexistent item' do      
       fill_in 'search_term', with: 'no such item'
       click_button 'Search'
       page.should have_content("Search term: no such item") 
       within('p') { page.should have_content("0 items found.") }    
     end
   end
end
