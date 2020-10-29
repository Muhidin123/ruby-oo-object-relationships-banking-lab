class Transfer
  # your code here

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    self.receiver.valid?  && self.sender.valid?
  end

  def execute_transaction
    if @status == "pending"
      if self.receiver.valid? && sender.balance > amount
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else sender.balance < amount && !valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end


  def reverse_transfer
    if @status == 'complete'
        sender.balance += amount
        receiver.balance -= amount
        @status = 'reversed'
      end
    end
  end



end
