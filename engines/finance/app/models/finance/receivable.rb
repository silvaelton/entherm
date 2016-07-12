module Finance
  class Receivable < ActiveRecord::Base
    belongs_to :bill_category
    belongs_to :cost_center
    belongs_to :contract, class_name: "Commercial::Contract"

    validates :cost_center, :name, :receivable_date, :value, presence: true
  end
end
