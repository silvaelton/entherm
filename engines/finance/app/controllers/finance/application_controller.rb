module Finance
  class ApplicationController < ActionController::Base
  
    layout 'application'

    include Pundit

    helper  ::UserHelper
    include ::UserHelper

    before_action :user_authenticate!

    helper_method :current_user

    private 

    def user_authenticate!
      if session[:user_id].nil?
        redirect_to '/geral' if controller_name != 'sessions'
      end
    end

  end
end
