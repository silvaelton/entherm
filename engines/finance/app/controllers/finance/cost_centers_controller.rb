require_dependency 'finance/application_controller'

module Finance
  class CostCentersController < ApplicationController
    before_action :set_cost_center, only: [:edit, :update,:destroy]
    
    def index
      @costs = Finance::CostCenter.all.order(:name)
    end

    def new
      @cost = Finance::CostCenter.new
    end

    def create
      @cost = Finance::CostCenter.new(set_params)

      if @cost.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def update
      if @cost.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @cost.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:cost_center).permit(:contract_id, :name, :description)
    end

    def set_cost_center
      @cost = Finance::CostCenter.find(params[:id])
    end
  end
end