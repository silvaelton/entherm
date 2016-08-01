module Finance
  class PayablePurchase < ActiveRecord::Base
    belongs_to :payable
    belongs_to :purchase, -> { order('id ASC') } , class_name: "Deal::Purchase" 
    
    validates :purchase, presence: true
    validates_uniqueness_of :purchase, scope: :payable
  end
end
