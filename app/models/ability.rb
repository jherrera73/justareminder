class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    else
      can :edit, User, :id => user.id
      can :update, User, :id => user.id 
      
      
      can :index, Contact
      can :new, Contact
      can :create, Contact
      can :edit, Contact, :user_id => user.id 
      can :update, Contact, :user_id => user.id
      
      can :index, Reminder
      can :new, Reminder
      can :create, Reminder
      can :show, Reminder
      can :edit, Reminder, :user_id => user.id 
      can :update, Reminder, :user_id => user.id
    end
    
    can :new, User
    
  end
end