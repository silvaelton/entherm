class CreateFinanceReceivables < ActiveRecord::Migration
  def change
    create_table :finance_receivables do |t|
      t.integer :contract_id, index: true
      t.integer :cost_center_id, index: true
      t.integer :bill_category_id, index: true

      t.date :receivable_date
      t.boolean :status, default: false

      t.string :name
      t.text :description
      t.string :value, default: 0
      
      t.timestamps null: false
    end
  end
end
