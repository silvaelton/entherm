require_dependency 'application_controller'
module Dashboard
  class ApplicationController < ActionController::Base
    layout 'application'
  	
  	include Pundit

    helper_method :current_user

    def current_user
      nil
    end
  end
end
