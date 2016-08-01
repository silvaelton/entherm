module Finance
  class Receivable < ActiveRecord::Base
    belongs_to :bill_category
    belongs_to :contract, class_name: "Commercial::Contract"

    validates :contract, :name, :receivable_date, :value, presence: true

    scope :by_contract,   -> (id) { where(contract_id: id)}
    scope :by_situation,  -> (value) { where(status: (value == '0') ? true : false)}

    validates :date_check, presence: true, if: :check?

    private

    def check?
      status.present?
    end

  end
end
