require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "root should should get user_sessions#login" do
    assert_routing '/login', { :controller => "user_sessions", :action => "new" }
  end
  
  test "root should should get user_sessions#logout" do
    assert_routing '/logout', { :controller => "user_sessions", :action => "destroy" }
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "Posting valid user credentials to UsersController#create should log in user" do   
    #Stage
        
    #Act
    post :create, :user_session => { :email => "jherrera@comcast.net", :password => "erin1975" }
    
    #Assert
    assert_redirected_to root_url
    
    assert_equal 'Login successful.', flash[:notice]
  end
  
  test "should log out user" do
    #Stage
    @user_session = UserSession.create(users(:one))
        
    #Act
    delete :destroy
    
    #Assert
    assert_redirected_to root_url
  end
  
  test "Posting invalid email to UserSessionsController#create should not log in user" do   
    #Stage
        
    #Act
    post :create, :user_session => { :email => "jherrera@", :password => "balls" }
    
    #Assert
    assert_select 'div.field_with_errors'
  end

end

