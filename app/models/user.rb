class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :email, :full_name, :password, :password_confirmation, :role

  before_save     :ensure_in_role
  
  ROLES = %w[Admin User]

  def admin?
    self.role == "Admin"
  end

  private

  def ensure_in_role
    self.role = "User" if self.role.blank?
  end
end
