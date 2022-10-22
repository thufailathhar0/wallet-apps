class Stock < ApplicationRecord
  extend Enumerize

  validates :code, presence: true, uniqueness: true

  enumerize :types, in: %i[deposit withdraw], scope: true
end
