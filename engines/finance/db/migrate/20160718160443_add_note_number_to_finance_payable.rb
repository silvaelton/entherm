class AddNoteNumberToFinancePayable < ActiveRecord::Migration
  def change
    add_column :finance_payables, :note_number, :string
    add_column :finance_payables, :date_check,  :date
  end
end
