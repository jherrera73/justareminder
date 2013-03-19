require 'test_helper'

class AbilityTest < ActiveSupport::TestCase

  setup do
    @user_one = users(:one)
    @user_two = users(:two)
  end
  
  test "should get to index if an admin" do
    ability = Ability.new(@user_one)
    assert ability.can?(:index, User.new)
  end
  
  test "user can only edit his profile which he owns" do
    ability = Ability.new(@user_two)
    assert ability.can?(:edit, @user_two)
    assert ability.cannot?(:edit, User.new)
  end

  test "should not get index if user is not an admin" do
    ability = Ability.new(@user_two)
    assert ability.cannot?(:index, User.new)
  end

  test "should get new if user is not an admin" do
    ability = Ability.new(@user_two)
    assert ability.can?(:new, User.new)
  end
  
  test "user can only edit his reminder which he owns" do
    ability = Ability.new(@user_two)
    assert ability.can?(:edit, @user_two)
    assert ability.cannot?(:edit, Reminder.new)
  end
  
  test "user can only edit his contact which he owns" do
    ability = Ability.new(@user_two)
    assert ability.can?(:edit, @user_two)
    assert ability.cannot?(:edit, Contact.new)
  end
  
  test "user can add new reminder" do
    ability = Ability.new(@user_two)
    assert ability.can?(:new, Reminder.new)
  end
  
  test "user can add new contact" do
    ability = Ability.new(@user_two)
    assert ability.can?(:new, Contact.new)
  end
  
end