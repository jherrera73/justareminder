require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  setup do
    @user = users(:one)
    @user_two = users(:two)
    @user_session = UserSession.create(users(:one))
  end
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { role: "User", 
                          email: "user@email.com", 
                          password: "friends", 
                          full_name: @user.full_name, 
                          password_confirmation: "friends"
                        }
    end

    assert_redirected_to users_path
  end
  
  test "posting invalid info should not create user" do

      post :create, user: { role: "User", 
                          email: "user@", 
                          password: "", 
                          full_name: @user.full_name, 
                          password_confirmation: ""
                        }

    assert_select 'div.field_with_errors'
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: @user.email, full_name: @user.full_name }
    assert_redirected_to users_path
  end
  
  test "putting invalid information should not update user" do
    put :update, id: @user, user: { email: "", full_name: "" }
    assert_select 'div.field_with_errors'
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

end
