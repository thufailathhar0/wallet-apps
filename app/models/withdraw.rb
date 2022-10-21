class Withdraw < ApplicationRecord
  has_many   :transactions, as: :fund, dependent: :destroy
  belongs_to :sender, class_name: 'Account'
  belongs_to :receiver, class_name: 'Stock'

  validate :amount_correct
  validates :amount, presence: true
  validates :receiver_number, presence: true

  def amount_correct
    errors.add(:amount, 'Stock balance less than withdraw amount') if sender.balance < amount
  end

  def create_transaction
  	transactions.build(subject: 'receiver', transactable: receiver)
    transactions.build(subject: 'sender', transactable: sender)
  end
end
