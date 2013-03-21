require 'test_helper'


class RemindersControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  setup do
    @reminder = reminders(:one)
    @user_session = UserSession.create(users(:one))
  end

  test "should get index of all reminders if admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reminders)
  end
  
  test "should get index of just users reminders if not admin" do
    @user_session.destroy
    @user_session = UserSession.create(users(:two))
    get :index
    assert_response :success
    assert_not_nil assigns(:reminders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reminder" do
    assert_difference('Reminder.count') do
      post :create, reminder: { description: @reminder.description, end: @reminder.end, start: @reminder.start}
    end

    assert_redirected_to reminders_path
  end
  
  test "invalid reminder info should not create reminder" do
    
    post :create, reminder: { description: "", end: @reminder.end, start: @reminder.start}

    assert_select 'div.field_with_errors'
  end

  test "should get edit" do
    get :edit, id: @reminder
    assert_response :success
  end

  test "should update reminder" do
    put :update, id: @reminder, reminder: { description: @reminder.description, end: @reminder.end, start: @reminder.start}
    assert_redirected_to reminders_path
  end
  
  test "invalid reminder info should not update reminder" do
    put :update, id: @reminder, reminder: { description: "", end: "", start: ""}
    assert_select 'div.field_with_errors'
  end

  test "should destroy reminder" do
    assert_difference('Reminder.count', -1) do
      delete :destroy, id: @reminder
    end

    assert_redirected_to reminders_path
  end
end
