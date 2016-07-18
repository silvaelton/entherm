class AddNoteNumberToFinanceReceivable < ActiveRecord::Migration
  def change
    add_column :finance_receivables, :note_number, :string
    add_column :finance_receivables, :observation, :text
    add_column :finance_receivables, :date_check,  :date
  end
end
