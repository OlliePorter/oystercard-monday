class Oystercard

  DEFAULT_MAX_BALANCE = 90

  attr_accessor :balance

  def initialize(in_journey = false)
    @balance = 0
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "NOPE" if balance_check?(amount)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  private

  def balance_check?(amount)
    amount + @balance > DEFAULT_MAX_BALANCE
  end

end
