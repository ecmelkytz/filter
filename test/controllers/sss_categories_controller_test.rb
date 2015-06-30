require 'test_helper'

class SssCategoriesControllerTest < ActionController::TestCase
  setup do
    @sss_category = sss_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sss_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sss_category" do
    assert_difference('SssCategory.count') do
      post :create, sss_category: { category_id: @sss_category.category_id, sss_id: @sss_category.sss_id }
    end

    assert_redirected_to sss_category_path(assigns(:sss_category))
  end

  test "should show sss_category" do
    get :show, id: @sss_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sss_category
    assert_response :success
  end

  test "should update sss_category" do
    patch :update, id: @sss_category, sss_category: { category_id: @sss_category.category_id, sss_id: @sss_category.sss_id }
    assert_redirected_to sss_category_path(assigns(:sss_category))
  end

  test "should destroy sss_category" do
    assert_difference('SssCategory.count', -1) do
      delete :destroy, id: @sss_category
    end

    assert_redirected_to sss_categories_path
  end
end
