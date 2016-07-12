class CreateFinanceCostCenters < ActiveRecord::Migration
  def change
    create_table :finance_cost_centers do |t|
      t.integer :contract_id, index: true
      t.string  :name
      t.string  :description
      t.timestamps null: false
    end
  end
end
