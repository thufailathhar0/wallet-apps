class Transaction < ApplicationRecord
  extend Enumerize

  belongs_to :fund, polymorphic: true
  belongs_to :transactable, polymorphic: true

  enumerize :subject, in: %i[sender receiver]

  after_create :calculate_balance

  def calculate_balance
    case self.subject

    when 'sender'
      self.transactable.update(balance: self.transactable.balance - self.fund.amount)
    when 'receiver'
      self.transactable.update(balance: self.transactable.balance + self.fund.amount)
    end
  end

   def sender_address
    if fund_type == 'Deposit'
      fund.sender.code
    else
      fund.sender.number
    end
  end

  def receiver_address
    if fund_type == 'Withdraw'
      fund.receiver.code
    else
      fund.receiver.number
    end
  end
end
