# spec/controllers/users_controller_spec.rb
require 'spec_helper'

describe UsersController, :type => :controller do

  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    login_user(@user)                
  end

  it 'renders the index' do
    get :index
    response.should render_template :index
  end
  
  it 'renders a single user' do
    get :show, id: @user._id
    response.should render_template :show
  end
  
  it 'renders the new user form' do
    get :new
    response.should render_template :new
  end
  
  it 'redirects to new user page after save' do
    post :create, user: FactoryGirl.attributes_for(:user) 
    response.should be_redirect
  end
  
  it 'creates a new user' do
    expect {
      post :create, user: FactoryGirl.attributes_for(:user)
    }.to change(User, :count).by(1)
  end

end