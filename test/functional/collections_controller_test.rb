require '../test_helper'

class CollectionsControllerTest < ActionController::TestCase
  setup do
    @collection = collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post :create, collection: { attr1: @collection.attr1, attr2: @collection.attr2, attr3: @collection.attr3, attr4: @collection.attr4, attr5: @collection.attr5, item_type: @collection.item_type, user_id: @collection.user_id }
    end

    assert_redirected_to collection_path(assigns(:collection))
  end

  test "should show collection" do
    get :show, id: @collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @collection
    assert_response :success
  end

  test "should update collection" do
    put :update, id: @collection, collection: { attr1: @collection.attr1, attr2: @collection.attr2, attr3: @collection.attr3, attr4: @collection.attr4, attr5: @collection.attr5, item_type: @collection.item_type, user_id: @collection.user_id }
    assert_redirected_to collection_path(assigns(:collection))
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete :destroy, id: @collection
    end

    assert_redirected_to collections_path
  end
end
