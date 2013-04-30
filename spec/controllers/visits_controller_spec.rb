# spec/controllers/visits_controller_spec.rb
require 'spec_helper'

describe VisitsController, :type => :controller do
  
  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
  end
  
  it 'fails to log in with incorrect password' do
    post :form_login, username: @user.username, password: 'wrong'
    response.should redirect_to("/visits/sign_in")
  end

  it 'fails to log in with nonexistent username' do
    post :form_login, username: 'wrong', password: @user.password
    response.should redirect_to("/visits/sign_in")
  end
  
  it 'logs in a valid user' do    
    post :form_login, username: @user.username, password: @user.password
    response.should redirect_to @user
  end
  
  it 'sets an _id cookie' do
    post :form_login, username: @user.username, password: @user.password
    cookies[:_id].should == @user._id
  end

  it 'sets a username cookie' do
    post :form_login, username: @user.username, password: @user.password
    cookies[:username].should == @user.username
  end

  it 'deletes cookies on logout' do
    post :form_login, username: @user.username, password: @user.password
    get :sign_out
    cookies.has_key?('_id').should be_false
    cookies.has_key?('username').should be_false  
  end
  
end