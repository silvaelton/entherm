require_dependency 'finance/application_controller'

module Finance
  class ReportsController < ApplicationController
    
    def general
      @contracts = Finance::PayableContract.all
    end

    def contract
    end
  end
end