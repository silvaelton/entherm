class CreateFinanceCostCenters < ActiveRecord::Migration
  def change
    create_table :finance_cost_centers do |t|

      t.timestamps null: false
    end
  end
end
