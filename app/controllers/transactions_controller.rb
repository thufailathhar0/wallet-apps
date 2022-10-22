class TransactionsController < ApplicationController
  
  def index
    @transactions = HistoryBalance.all
  end

end
