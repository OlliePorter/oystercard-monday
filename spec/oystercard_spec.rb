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

end
