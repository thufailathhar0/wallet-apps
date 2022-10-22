class CreateHistoryBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :history_balances do |t|
      t.references :transaction
      t.bigint :balancetable_id
      t.string :balancetable_type
      t.decimal :balance_before
      t.decimal :balance_after
      t.timestamps
    end
  end
end
