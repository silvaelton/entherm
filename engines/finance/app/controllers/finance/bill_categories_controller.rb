require_dependency 'finance/application_controller'
module Finance
  class BillCategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update,:destroy]
    
    def index
      @categories = Finance::BillCategory.all.order(:name)
    end

    def new
      @category = Finance::BillCategory.new
    end

    def create
      @category = Finance::BillCategory.new(set_params)

      if @category.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def update
      if @category.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @category.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:bill_category).permit(:name, :description)
    end

    def set_category
      @category = Finance::BillCategory.find(params[:id])
    end
  end
end