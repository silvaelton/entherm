class CreateFinancePayables < ActiveRecord::Migration
  def change
    create_table :finance_payables do |t|
      t.integer :contract_id, index: true
      t.integer :bill_category_id, index: true
      t.integer :cost_center_id, index: true
      t.timestamps null: false
    end
  end
end
