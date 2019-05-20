class Oystercard
  DEFAULT_MAX_BALANCE = 90
  DEFAULT_MIN_BALANCE = 1

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
    raise "Card does not have the minimum balance loaded" if min_balance_not_met?

    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  private

  def balance_check?(amount)
    amount + @balance > DEFAULT_MAX_BALANCE
  end

  def min_balance_not_met?
    balance < DEFAULT_MIN_BALANCE
  end
end
