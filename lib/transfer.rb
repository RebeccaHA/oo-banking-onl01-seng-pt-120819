class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bank_account
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    
end
