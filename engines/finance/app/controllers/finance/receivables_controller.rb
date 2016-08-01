
require_dependency 'finance/application_controller'
module Finance
  class ReceivablesController < ApplicationController
    before_action :set_receivable, only: [:edit, :update,:destroy]
    
    has_scope :by_contract
    has_scope :by_situation
    
    def index
      @receivables = apply_scopes(Finance::Receivable).all.order('receivable_date DESC')
    end

    def new
      @receivable = Finance::Receivable.new
    end

    def create
      @receivable = Finance::Receivable.new(set_params)

      if @receivable.save 
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      if @receivable.update(set_params)
        flash[:success] = t :success
        redirect_to action: :index
      else
        render action: :edit
      end
    end

    def destroy
      if @receivable.destroy 
        flash[:success] = t :success
      else
        flash[:danger] = t :danger
      end

      redirect_to action: :index
    end

    private

    def set_params
      params.require(:receivable).permit(:contract_id, :bill_category_id, :cost_center_id,
                                       :name, :description, :observation, :receivable_date, :value,  :status,
                                        :date_check, :note_number)
    end

    def set_receivable
      @receivable = Finance::Receivable.find(params[:id])
    end
  end
end