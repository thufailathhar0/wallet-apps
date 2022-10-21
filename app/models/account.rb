class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions, as: :transactable
end
