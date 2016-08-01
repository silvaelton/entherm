module Finance
  class Payable < ActiveRecord::Base

    belongs_to :bill_category

    has_many  :payable_purchases
    has_many  :payable_contracts

    accepts_nested_attributes_for :payable_purchases,   allow_destroy: true
    accepts_nested_attributes_for :payable_contracts,  allow_destroy: true
  
    
    scope :by_contract, -> (id) { 
      joins(:payable_contracts).where('finance_payable_contracts.contract_id = ?', id)      
    }

    scope :by_status,   -> (status = true) { where(status: (status == "true") ? true : false)}



    validates :bill_category, :name, :description, :date_payable, :value, presence: true
    validates :date_check, presence: true, if: :check?

    validate :total_value

    private

    def check?
      status.present?
    end

    def total_value
      general_value = 0
      self.payable_contracts.each do |item|
        value = item.value.gsub('R$','').to_f
        general_value += value
      end

      if general_value > value.gsub('R$','').to_f
        errors.add(:value, 'O valor nos centros de custo não pode ultrapassar o total da conta') 
      end
    end
  end
end
