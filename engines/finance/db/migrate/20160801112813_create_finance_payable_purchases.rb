class CreateFinancePayablePurchases < ActiveRecord::Migration
  def change
    create_table :finance_payable_purchases do |t|
      t.integer :purchase_id, index: true
      t.integer :payable_id,  index: true
      t.timestamps null: false
    end
  end
end
