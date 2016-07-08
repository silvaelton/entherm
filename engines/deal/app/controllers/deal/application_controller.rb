require_dependency 'application_controller'
require_dependency 'deal/application_helper'

module Deal
  class ApplicationController < ActionController::Base
    layout 'application'

    include Pundit

    helper ::ApplicationHelper
  end
end
