module Finance
  class Payable < ActiveRecord::Base
    belongs_to :bill_category
    belongs_to :contract, class_name: "Commercial::Contract"
    belongs_to :purchase, class_name: "Deal::Purchase"

    validates :name,:contract, :date_payable, :value, presence: true
  end
end
