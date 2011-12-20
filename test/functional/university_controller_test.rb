require 'test_helper'

class UniversityControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get faculties" do
    get :faculties
    assert_response :success
  end

  test "should get departments" do
    get :departments
    assert_response :success
  end

end
