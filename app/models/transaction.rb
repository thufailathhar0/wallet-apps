class Transaction < ApplicationRecord
  extend Enumerize

  belongs_to :source, polymorphic: true
  belongs_to :target, polymorphic: true
  has_many :history_balances

  enumerize :types, in: %i[deposit withdraw transfer], scope: true

  after_create :calculate_balance

  validate :amount_correct
  validates :amount, presence: true

  def amount_correct
    errors.add(:amount, 'Balance less than amount') if source.balance <= amount
  end

  def calculate_balance
    source.update(balance: source.balance - amount)
    history_balances.create(balance_before: (source.balance + amount), balance_after: source.balance, balancetable: source)
    target.update(balance: target.balance + amount)
    history_balances.create(balance_before: (target.balance - amount), balance_after: target.balance, balancetable: target)
  end   
end
