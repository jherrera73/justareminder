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


  test "should create user and save user session and redirect to root_url" do
    @user_session.destroy
    
    assert_difference('Reminder.count') do
      post :create, user: { role: "User", 
                            email: "user@email.com", 
                            password: "friends", 
                            full_name: @user.full_name,
                            time_zone: @user.time_zone, 
                            password_confirmation: "friends"
                          }
    end

    
    #Will return errors from save method -- keep in mind for later use
    #assert_nil assigns(:user).errors
    
    assert_not_nil @user_session

    assert_redirected_to root_url
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
    put :update, id: @user, user: { email: @user.email, full_name: @user.full_name, time_zone: @user.time_zone }
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
