require_dependency 'finance/application_controller'
module Finance
  class PayablesController < ApplicationController
    before_action :set_payable, only: [:edit, :update,:destroy]
    
    has_scope :by_contract
    has_scope :by_status
    has_scope :period,:using => [:date_start, :date_end], :type => :hash


    def index
      if !params[:period].present?
        params[:period] = {}
        params[:period][:date_start] = Date.today.beginning_of_month.strftime('%d/%m/%Y')
        params[:period][:date_end]   = Date.today.end_of_month.strftime('%d/%m/%Y')
      end

      @payables = apply_scopes(Finance::PayableParcel).all.order('due DESC')
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

    def update_parcel
      @parcel = Finance::PayableParcel.find(params[:parcel_id])
      @parcel.update(status: @parcel.pago? ? 0 : 1)

      redirect_to :back
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
                                       :purchase_id, :date_payable, :supplier_id, :value,  :status, :date_check,
                                       :note_number, payable_contracts_attributes: [:contract_id, :value, :_destroy, :id],
                                       payable_purchases_attributes: [:purchase_id,:_destroy, :id],
                                       payable_parcels_attributes: [:value, :status, :due,:id, :_destroy, :number])
    end

    def set_payable
      @payable = Finance::Payable.find(params[:id])
    end
  end
end