class CreateFinanceReceivables < ActiveRecord::Migration
  def change
    create_table :finance_receivables do |t|

      t.timestamps null: false
    end
  end
end
