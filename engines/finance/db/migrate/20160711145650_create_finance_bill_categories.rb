class CreateFinanceBillCategories < ActiveRecord::Migration
  def change
    create_table :finance_bill_categories do |t|
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
