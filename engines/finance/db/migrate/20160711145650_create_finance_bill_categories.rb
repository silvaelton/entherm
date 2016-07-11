class CreateFinanceBillCategories < ActiveRecord::Migration
  def change
    create_table :finance_bill_categories do |t|

      t.timestamps null: false
    end
  end
end
