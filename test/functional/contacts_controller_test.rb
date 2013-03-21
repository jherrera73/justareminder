require 'test_helper'


class ContactsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  setup do
    @contact = contacts(:one)
    @user = users(:one)
    @user_session = UserSession.create(users(:one))
  end

  test "should get index fo all contacts if user is admin" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end
  
  test "should get index of just users contacts if not admin" do
    @user_session.destroy
    @user_session = UserSession.create(users(:two))
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post :create, contact: { full_name: @contact.full_name, email: @contact.email}
    end

    assert_redirected_to contacts_path
  end
  
  test "invalid contact info should not create contact" do
    
    post :create, contact: { full_name: "", email: @contact.email}

    assert_select 'div.field_with_errors'
  end


  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    put :update, id: @contact, contact: { full_name: @contact.full_name, email: @contact.email}
    assert_redirected_to contacts_path
  end
  
  test "invalid info posted to update should not update contact" do
    put :update, id: @contact, contact: { full_name: "", email: ""}
    assert_select 'div.field_with_errors'
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
