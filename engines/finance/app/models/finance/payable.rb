module Finance
  class Payable < ActiveRecord::Base
    belongs_to :bill_category
    belongs_to :cost_center
    belongs_to :purchase, class_name: "Deal::Purchase"

    validates :name, :cost_center, :date_payable, :value, presence: true
  end
end
