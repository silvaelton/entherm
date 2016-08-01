require_dependency 'finance/application_controller'
module Finance
  class PayablesController < ApplicationController
    before_action :set_payable, only: [:edit, :update,:destroy]
    
    has_scope :by_contract
    has_scope :by_status

    def index
      @payables = apply_scopes(Finance::Payable).all.order('date_payable DESC')
    end

    def new
      @payable = Finance::Payable.new
    end

    def create
      @payable = Finance::Payable.new(set_params)

      if @payable.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @payable.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @payable.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:payable).permit(:contract_id, :bill_category_id, :cost_center_id,
                                       :name, :description, :observation, :type_payable, 
                                       :purchase_id, :date_payable, :value,  :status, :date_check,
                                       :note_number, payable_contracts_attributes: [:contract_id, :value, :_destroy, :id],
                                       payable_purchases_attributes: [:purchase_id,:_destroy, :id])
    end

    def set_payable
      @payable = Finance::Payable.find(params[:id])
    end
  end
end