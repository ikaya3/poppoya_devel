require 'rspec'
require './telegram_factory'

describe TelegramFactory do
  before do
    @factory = TelegramFactory.new
  end

  it 'should not have a telegram at initial state.' do
    expect(@factory.pop_telegram).to be_nil
  end

  it 'should have a telegram on receive the legal byte-array.' do
    received = Telegram.new([0xFF, 0x00, 0x00, 0x01, 0x00])
    received.to_array.each do |byte|
      @factory.push_byte(byte)
    end
    expect(@factory.pop_telegram).to eq(received)
  end
end
