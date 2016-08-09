module Finance
  class PayablePurchase < ActiveRecord::Base
    belongs_to :payable
    belongs_to :purchase, -> { order('id ASC') } , class_name: "Deal::Purchase" 
    
    validates :purchase_id, presence: true
    validate :purchase_exist?

    private

    def purchase_exist?
      purchase = Deal::Purchase.find(self.purchase_id) rescue nil
      
      errors.add(:purchase_id, "FPA não existe, favor inserir somente o número sem data") if purchase.nil?
    end
  end
end
