class Stock < ApplicationRecord
  extend Enumerize
  has_many :transactions, as: :transactable

  validates :code, presence: true, uniqueness: true

  enumerize :types, in: %i[deposit withdraw], scope: true
end
