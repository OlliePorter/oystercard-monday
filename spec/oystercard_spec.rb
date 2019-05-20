require 'oystercard'

describe Oystercard do
  it 'expects new oystercard to have a balance of 0' do
    oystercard = Oystercard.new
    expect(oystercard.balance).to eq(0)
  end

  it 'can increase the balance if top-up is called' do
    oystercard = Oystercard.new

    oystercard.top_up(5)

    expect(oystercard.balance).to eq(5)
  end

  it 'raises an error when one stupud human tries to add more than the maximum balance' do
    oystercard = Oystercard.new
    expect{oystercard.top_up(Oystercard::DEFAULT_MAX_BALANCE + 1)}.to raise_error("NOPE")
  end

  it 'expects in_journey? to return false' do
    oystercard = Oystercard.new
    expect(oystercard.in_journey?).to eq(false)
  end

  it 'can touch in and change to being in journey' do
    oystercard = Oystercard.new(false)
    oystercard.top_up(Oystercard::DEFAULT_MIN_BALANCE)

    oystercard.touch_in(double('my dummy station'))

    expect(oystercard.in_journey?).to eq(true)
  end

  it 'can touch out and change to being not in journey' do
    oystercard = Oystercard.new(true)
    oystercard.touch_out
    expect(oystercard.in_journey?).to eq(false)
  end

  it 'will throw an error if there is less than the minimum balance' do
    oystercard = Oystercard.new(false)

    expect{oystercard.touch_in(double('my dummy station'))}
      .to raise_error("Card does not have the minimum balance loaded")
  end

  it 'will deduct the minimum fare amount from the balance when touching out' do
    oystercard = Oystercard.new(true)
    expect{oystercard.touch_out}
      .to change{oystercard.balance}.by(-Oystercard::DEFAULT_MIN_BALANCE)
  end

  it 'can remember what station was last touched in at' do
    oystercard = Oystercard.new(false)
    oystercard.top_up(50)

    oystercard.touch_in('Barbican')

    expect(oystercard.station).to eq('Barbican')
  end

end
