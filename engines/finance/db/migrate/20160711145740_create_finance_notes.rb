class CreateFinanceNotes < ActiveRecord::Migration
  def change
    create_table :finance_notes do |t|

      t.timestamps null: false
    end
  end
end
