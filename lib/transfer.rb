require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bank_account
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
   @sender.valid? && @receiver.valid?
  end
 
 def execute_transaction
   if self.valid? && @sender.balance >= @amount && @status == "pending"
       @sender.deposit(@amount*-1)
       @receiver.deposit(@amount)
       @status = "complete"
   else
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
   end
 end
 
 def reverse_transfer
   if status == "complete"
     @sender.deposit(@amount)
     @receiver.deposit(@amount*-1)
     @status = "reversed"
   end
 end

end
