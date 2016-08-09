module Finance
  class Payable < ActiveRecord::Base

    belongs_to :bill_category
    belongs_to :supplier, -> { order(:name)}, class_name: "Deal::Supplier"

    has_many  :payable_purchases
    has_many  :payable_contracts
    has_many  :payable_parcels

    accepts_nested_attributes_for :payable_purchases,   allow_destroy: true
    accepts_nested_attributes_for :payable_contracts,  allow_destroy: true
    accepts_nested_attributes_for :payable_parcels,  allow_destroy: true
  
    
    scope :by_contract, -> (id) { 
      joins(:payable_contracts).where('finance_payable_contracts.contract_id = ?', id)      
    }

    scope :by_status,   -> (status = true) { where(status: (status == "true") ? true : false)}

    validates :bill_category, :name, :description, :value, presence: true
    validates :date_check, presence: true, if: :check?

    validate :parcel_validate
    validate :contract_validate

    private

    def contract_validate
       if self.payable_contracts.present?
        value = 0
        
        self.payable_contracts.each do |item|
          value += item.value.gsub('R$', '').to_f
        end 

        if value > self.value.gsub('R$', '').to_f
          errors.add(:value, "O valor da soma dos centros de custo é maior que o valor total da conta, o valor deve ser igual")
        elsif value < self.value.gsub('R$', '').to_f 
          errors.add(:value, "O valor da soma dos centros de custo é menor que o valor total da conta, o valor deve ser igual")
        end
          
      else
        errors.add(:value, "É necessário inserir ao menos uma parcela")
      end     
    end

    def parcel_validate
      if self.payable_parcels.present?
        value = 0
        
        self.payable_parcels.each do |item|
          value += item.value.gsub('R$', '').to_f
        end 

        if value > self.value.gsub('R$', '').to_f
          errors.add(:value, "O valor da soma das parcelas é maior que o valor total da conta, o valor deve ser igual")
        elsif value < self.value.gsub('R$', '').to_f 
          errors.add(:value, "O valor da soma das parcelas é menor que o valor total da conta, o valor deve ser igual")
        end
          
      else
        errors.add(:value, "É necessário inserir ao menos uma parcela")
      end
    end

    def check?
      status.present?
    end

  end
end
