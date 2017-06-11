class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status == "pending"
      if @sender.balance > @amount
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if status == "complete"
      if @receiver.balance > @amount
        @sender.deposit(@amount)
        @receiver.withdraw(@amount)
        @status = "reversed"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end
end
