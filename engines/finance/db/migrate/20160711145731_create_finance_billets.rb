class CreateFinanceBillets < ActiveRecord::Migration
  def change
    create_table :finance_billets do |t|

      t.timestamps null: false
    end
  end
end
