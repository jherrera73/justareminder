class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

    def authenticate
        redirect_to login_url, :notice => "Please signin." unless current_user != nil
    end

    def current_user_session
      @current_user_session ||= UserSession.find
    end
    
    def signed_in?
      not(current_user.nil?)
    end
    
    def not_signed_in?
      current_user.nil?
    end

    def current_user
      @current_user ||= current_user_session && current_user_session.record
    end

    def current_user?(user)
      user == current_user
    end
    
end
