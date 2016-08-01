class CreateFinancePayableContracts < ActiveRecord::Migration
  def change
    create_table :finance_payable_contracts do |t|
      t.integer :payable_id,  index: true
      t.integer :contract_id,  index: true
      t.string  :value

      t.timestamps null: false
    end
  end
end
