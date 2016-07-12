module Finance
  class CostCenter < ActiveRecord::Base
    belongs_to :contract, class_name: "Commercial::Contract"

    validates :name, presence: true, uniqueness: true
  end
end
