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

    allow(cryptor.shifter).to receive(:set_date).and_return("111122")
    expect(cryptor.shifter.set_date).to eq("111122")
  end

  it 'has offsets from shifter' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    allow(cryptor.shifter).to receive(:offset).and_return([8,8,8,4])
    expect(cryptor.shifter.offset).to eq([8,8,8,4])
  end

  it 'has a shifter set' do
    cryptor = Cryptor.new
    shifter = Shifter.new

    allow(cryptor.shifter).to receive(:offset).and_return([8,8,8,4])
    allow(cryptor.shifter).to receive(:flatten_key_pairs).and_return([12, 23, 34, 45])
    expect(cryptor.shifter.shifter_set(cryptor.shifter.flatten_key_pairs, cryptor.shifter.offset)).to eq([20, 31, 42, 49])
  end

  describe '#cipher' do
    it ' take a message and iterates over the character_set to return encrypted string' do
      cryptor = Cryptor.new
      shifter = Shifter.new
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]

      allow(cryptor.shifter).to receive(:offset).and_return([02,27,71,15])
      allow(cryptor.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
      allow(cryptor.shifter).to receive(:shifter_set).and_return([3,27,73,20])

      message = "hello world"
      message2 = "hello World!"
      message3 = "HeLlO wOrlD!!"

      expect(cryptor.cipher(message, cryptor.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw")
      expect(cryptor.cipher(message2, cryptor.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!")
      expect(cryptor.cipher(message3, cryptor.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!!")
    end
  end
end
