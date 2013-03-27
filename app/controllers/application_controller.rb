class ApplicationController < ActionController::Base
  protect_from_forgery
  
  around_filter :user_time_zone, if: :current_user

  helper_method :current_user

  private

    def authenticate
        redirect_to login_url, :notice => "Please signin." unless current_user != nil
    end

    def current_user_session
      @current_user_session ||= UserSession.find
    end
    
    def current_user
      @current_user ||= current_user_session && current_user_session.record
    end

    def current_user?(user)
      user == current_user
    end
    
    def user_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end
end