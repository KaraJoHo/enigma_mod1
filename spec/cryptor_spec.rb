require 'rspec'
require './lib/shifter'
require './lib/cryptor'

RSpec.describe Cryptor do
  it 'exists' do
    cryptor = Cryptor.new

    expect(cryptor).to be_a(Cryptor)
  end

  it 'has a shifter object' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    expect(cryptor.shifter).to be_a(Shifter)
  end

  describe '#character_set' do
    it 'has an array of the alphabet' do
      cryptor = Cryptor.new

      expected_set = ("a".."z").to_a << " "
      expect(cryptor.character_set).to eq(expected_set)
    end
  end

  it 'has a date from shifter' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    allow(cryptor).to receive(:set_date).and_return("111122")
    expect(cryptor.set_date).to eq("111122")
  end

  it 'has offsets from shifter' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    expect(cryptor.offset("111122")).to eq([8,8,8,4])
  end

  describe '#cipher' do
    it ' take a message and iterates over the character_set to return encrypted string' do
      cryptor = Cryptor.new
      shifter = Shifter.new

      message = "hello world"
      message2 = "HeLlO wOrlD!!"

      expect(cryptor.cipher(message,([3,27,73,20]))).to eq("keder ohulw")
      expect(cryptor.cipher(message2, [3,27,73,20])).to eq("keder ohulw!!")

    end
  end
end
