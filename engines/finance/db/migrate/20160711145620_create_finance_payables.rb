class CreateFinancePayables < ActiveRecord::Migration
  def change
    create_table :finance_payables do |t|
      t.integer :contract_id, index: true
      t.integer :bill_category_id, index: true
      t.integer :cost_center_id, index: true

      t.string  :name 
      t.text    :description
      t.text    :observation
      t.integer :type_payable, default: 0
      t.integer :purchase_id, index: true
      t.date    :date_payable
      t.boolean :status, default: false
      t.string  :value, default: "0"

      t.timestamps null: false
    end
  end
end
