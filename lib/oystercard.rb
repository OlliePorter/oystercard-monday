class Oystercard
  DEFAULT_MAX_BALANCE = 90
  DEFAULT_MIN_BALANCE = 1

  attr_accessor :balance, :entry_station

  def initialize(in_journey = false)
    @balance = 0
    @in_journey = in_journey
    @entry_station = nil
  end

  def top_up(amount)
    raise "NOPE" if balance_check?(amount)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Card does not have the minimum balance loaded" if min_balance_not_met?
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    @entry_station = nil
    deduct(DEFAULT_MIN_BALANCE)
    @in_journey = false
  end

  private

  def balance_check?(amount)
    amount + @balance > DEFAULT_MAX_BALANCE
  end

  def min_balance_not_met?
    balance < DEFAULT_MIN_BALANCE
  end

  def deduct(fare)
    @balance -= fare
  end

end
