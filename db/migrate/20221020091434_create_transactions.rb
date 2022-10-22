class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount, precision: 5, scale: 2, default: 0, null: false
      t.bigint  :source_id
      t.string  :source_type
      t.bigint  :target_id
      t.string  :target_type
      t.string  :types
      t.timestamps
    end

    add_index :transactions, %i[source_id source_type]
    add_index :transactions, %i[target_id target_type]
  end
end
