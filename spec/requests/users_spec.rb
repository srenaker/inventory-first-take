# spec/requests/users_spec.rb
require 'spec_helper'

describe "Users", :type => :request do
  
  before :each do
    DatabaseCleaner.clean
  end

  it 'creates a new user' do
    pw = (rand() * 100).to_s
    visit '/'
    click_link 'Sign up'
    expect {
      fill_in 'First name', with: Faker::Name.first_name
      fill_in 'Last name', with: Faker::Name.last_name    
      fill_in 'Username', with: Faker::Name.name
      fill_in 'Password', with: pw
      click_button 'Create User'
    }.to change(User, :count).by(1)
    page.should have_content('User was successfully created.')
         
  end

  it 'lists existing collections on user page' do
    user = FactoryGirl.create(:user)
    coll1 = FactoryGirl.create(:collection, user_id: user.id)
    visit user_path(user)
    within('li') { page.should have_content(coll1.item_type) }
  end
  
  it 'lists all users' do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    
    visit '/users' do
      page.should have_content user1.firstname
      page.should have_content user2.firstname
      page.should have_content user3.firstname
    end
  end

  it 'lists all collections belonging to each user' do
    user1 = FactoryGirl.create(:user)
    coll1 = FactoryGirl.create(:collection, user_id: user1.id)
    user2 = FactoryGirl.create(:user)
    coll2 = FactoryGirl.create(:collection, user_id: user2.id)
    user3 = FactoryGirl.create(:user)
    coll3 = FactoryGirl.create(:collection, user_id: user3.id)
        
    visit '/users' do
      page.should have_content coll1.item_type
      page.should have_content coll2.item_type
      page.should have_content coll3.item_type
    end
  end
  
end