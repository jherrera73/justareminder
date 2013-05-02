require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "pages#index should have proper title" do
    setup_for_admin
    get :index
    assert_select 'title', /Just a reminder/  
  end
  
  test "should get index of all reminders for public view" do
    get :reminders, id: users(:one).public_key
    assert_response :success
  end
  
  private
  
  def setup_for_admin
    @user_session = UserSession.create(users(:one))
  end
  
  def setup_for_non_admin
    @user_session = UserSession.create(users(:two))
  end
  
end
