module Finance
  class PayableContract < ActiveRecord::Base
    belongs_to :payable
    belongs_to :contract, class_name: "Commercial::Contract"

    validates :contract, :value, presence: true
    validates_uniqueness_of :contract, scope: :payable
  end
end
