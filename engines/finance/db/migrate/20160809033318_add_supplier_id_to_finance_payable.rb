class AddSupplierIdToFinancePayable < ActiveRecord::Migration
  def change
    add_column :finance_payables, :supplier_id, :integer
  end
end
