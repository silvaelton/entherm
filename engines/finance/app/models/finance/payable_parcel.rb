module Finance
  class PayableParcel < ActiveRecord::Base
    belongs_to :payable
    has_many :payable_contracts, through: :payable

    scope :by_status, -> (status) { where(status: (status == 'true') ? 1 : 0) }
    scope :period, -> date_start, date_end { where(due: Date.parse(date_start)..Date.parse(date_end))}
       
    scope :by_contract, -> (id) {
      joins(:payable_contracts).where('finance_payable_contracts.contract_id = ?', id)
    }

    enum status: ['não_pago', 'pago']
    validates_date :due, presence: true
    

    def self.sum_values
      value = 0
      all.each do |item|
        value += item.value.gsub('R$', '').to_f
      end

      return value
    end
  end
end
