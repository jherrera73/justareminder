require 'test_helper'


class ContactsControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  setup do
    @contact = contacts(:one)
    @user = users(:one)
    @user_session = UserSession.create(users(:one))
  end

  test "should get index" do
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

    assert_redirected_to contact_path(assigns(:contact))
  end


  test "should get edit" do
    get :edit, id: @contact
    assert_response :success
  end

  test "should update contact" do
    put :update, id: @contact, contact: { full_name: @contact.full_name, email: @contact.email}
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
