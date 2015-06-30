require 'test_helper'

class SssesControllerTest < ActionController::TestCase
  setup do
    @sss = ssses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ssses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sss" do
    assert_difference('Sss.count') do
      post :create, sss: { answer: @sss.answer, question: @sss.question }
    end

    assert_redirected_to sss_path(assigns(:sss))
  end

  test "should show sss" do
    get :show, id: @sss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sss
    assert_response :success
  end

  test "should update sss" do
    patch :update, id: @sss, sss: { answer: @sss.answer, question: @sss.question }
    assert_redirected_to sss_path(assigns(:sss))
  end

  test "should destroy sss" do
    assert_difference('Sss.count', -1) do
      delete :destroy, id: @sss
    end

    assert_redirected_to ssses_path
  end
end
