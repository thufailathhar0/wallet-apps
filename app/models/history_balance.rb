class HistoryBalance < ApplicationRecord

  belongs_to :balancetable, polymorphic: true
  belongs_to :transac, foreign_key: "transaction_id", class_name: "Transaction"

  def balancetable_address
    if balancetable_type == 'Stock'
      balancetable.code
    else
      balancetable.number
    end
  end
end
