# spec/controllers/items_controller_spec.rb
require 'spec_helper'

describe ItemsController, :type => :controller do

  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    login_user(@user)                
    @collection = FactoryGirl.create(:collection, user_id: @user.id )
    @item = FactoryGirl.create(:item, user_id: @user.id, collection_id: @collection.id)
  end
  
  it 'has no index' do
    get :index
    response.should redirect_to @user
  end
  
  it 'renders the #new view' do
    get :new, item_type: @collection.item_type
    response.should render_template :new
  end
  
  it 'redirects to collection view after save' do
    post :create, item: FactoryGirl.attributes_for(:item, collection_id: @collection.id)
    response.should redirect_to @collection
  end
  
  it 'creates a new item' do
    expect{
      post :create, item: FactoryGirl.attributes_for(:item, collection_id: @collection.id)
    }.to change(Item,:count).by(1)
  end
  
  
  it 'redirects to collection view after destroy' do
    delete :destroy, id: @item
    response.should redirect_to @collection
  end
  
  it 'deletes the item' do
    expect{
      delete :destroy, id: @item        
    }.to change(Item, :count).by(-1)
  end
  
end