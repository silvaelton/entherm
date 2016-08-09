class CreateFinancePayableParcels < ActiveRecord::Migration
  def change
    create_table :finance_payable_parcels do |t|
      
      t.integer :payable_id, index: true
      t.string  :value, default: '0'
      t.integer :number, default: 1
      t.date    :due
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
