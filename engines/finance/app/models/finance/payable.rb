module Finance
  class Payable < ActiveRecord::Base

    belongs_to :bill_category
    belongs_to :supplier, -> { order(:name)}, class_name: "Deal::Supplier"

    has_many  :payable_purchases, inverse_of: :payable
    has_many  :payable_contracts, inverse_of: :payable
    has_many  :payable_parcels, autosave: true

    accepts_nested_attributes_for :payable_purchases,   allow_destroy: true
    accepts_nested_attributes_for :payable_contracts,   allow_destroy: true
    accepts_nested_attributes_for :payable_parcels,    allow_destroy: false
  
    
    scope :by_contract, -> (id) { 
      joins(:payable_contracts).where('finance_payable_contracts.contract_id = ?', id)      
    }

    scope :by_status,   -> (status = true) { where(status: (status == "true") ? true : false)}

    validates :bill_category, :name, :description, :value, presence: true
    validates :date_check, presence: true, if: :check?
  
    validate :contract_validate
    validate :parcel_validate

    def update_nested_objects(nested_attributes)

      %w(parcels contracts purchases).each do |item|
        if nested_attributes["payable_#{item}_attributes".to_sym].present?
          nested_attributes["payable_#{item}_attributes".to_sym].each_with_index do |child, index|
            if child[1][:_destroy].to_i == 1
              self.send("payable_#{item}").find(child[1][:id].to_i).destroy 
              nested_attributes["payable_#{item}_attributes".to_sym].delete(child[0].to_s)
            end 
          end
        end
      end

      update(nested_attributes)
    end 

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
        errors.add(:value, "É necessário inserir ao menos um centro de custo")
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
