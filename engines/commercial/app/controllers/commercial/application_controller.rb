require_dependency 'application_controller'

module Commercial
  class ApplicationController < ActionController::Base
    layout 'application'

    include Pundit
  end
end
