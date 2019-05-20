class Oystercard

  DEFAULT_MAX_BALANCE = 90

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "NOPE" if balance_check?(amount)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  private

  def balance_check?(amount)
    amount + @balance > DEFAULT_MAX_BALANCE
  end

end
