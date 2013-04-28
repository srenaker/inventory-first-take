# spec/controllers/collections_controller_spec.rb
require 'spec_helper'

describe CollectionsController, :type => :controller do

  before :each do
    DatabaseCleaner.clean
    @user = FactoryGirl.create(:user)
    login_user(@user)                
    @collection = FactoryGirl.create(:collection, user_id: @user.id )
    @item = FactoryGirl.create(:item, user_id: @user.id, collection_id: @collection.id)
  end
  
  it "redirects to user's list of collections upon save" do
    post :create, collection: FactoryGirl.attributes_for(:collection)
    response.should redirect_to @user
  end
  
  it 'creates a new collection' do
    expect{
      post :create, collection: FactoryGirl.attributes_for(:collection)
    }.to change(Collection, :count).by(1)
  end
  
  it 'has no index' do
    get :index
    response.should redirect_to @user
  end
  
  it 'renders the #show view' do
    get :show, id: @collection
    response.should render_template :show
  end
  
  it 'renders the #new view' do
    get :new
    response.should render_template :new
  end
  
  it 'renders the search results view' do
    post :search_results, search_term: @item.attr1, search_field: 'attr1'
    response.should render_template :search_results
  end
  
  it 'redirects to @user after deleting a collection' do
    delete :destroy, id: @collection
    response.should redirect_to @user
  end
  
  it "deletes the collection" do
    expect{
      delete :destroy, id: @collection        
    }.to change(Collection, :count).by(-1)
  end
  
  
end