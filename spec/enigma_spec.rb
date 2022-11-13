require 'rspec'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it 'has a shifter object' do
    enigma = Enigma.new
    shifter = Shifter.new

    expect(enigma.shifter).to be_a(Shifter)
  end

  describe '#character_set' do
    it 'has an array of the alphabet' do
      enigma = Enigma.new

      expected_set = ("a".."z").to_a << " "
      expect(enigma.character_set).to eq(expected_set)
    end
  end

  it 'has a date from shifter' do
    enigma = Enigma.new
    shifter = Shifter.new

    allow(enigma.shifter).to receive(:set_date).and_return("111122")
    expect(enigma.shifter.set_date).to eq("111122")
  end

  it 'has offsets from shifter' do
    enigma = Enigma.new
    shifter = Shifter.new

    allow(enigma.shifter).to receive(:offset).and_return([8,8,8,4])
    expect(enigma.shifter.offset).to eq([8,8,8,4])
  end

  it 'has a shifter set' do
    enigma = Enigma.new
    shifter = Shifter.new

    allow(enigma.shifter).to receive(:offset).and_return([8,8,8,4])
    allow(enigma.shifter).to receive(:flatten_key_pairs).and_return([12, 23, 34, 45])
    expect(enigma.shifter.shifter_set(enigma.shifter.flatten_key_pairs, enigma.shifter.offset)).to eq([20, 31, 42, 49])
  end

  describe '#cipher' do
    it ' take a message and iterates over the character_set to return encrypted string' do
      enigma = Enigma.new
      shifter = Shifter.new
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]

      allow(enigma.shifter).to receive(:offset).and_return([02,27,71,15])
      allow(enigma.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
      allow(enigma.shifter).to receive(:shifter_set).and_return([3,27,73,20])

      message = "hello world"
      message2 = "hello World!"
      message3 = "HeLlO wOrlD!!"

      expect(enigma.cipher(message, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw")
      expect(enigma.cipher(message2, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!")
      expect(enigma.cipher(message3, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!!")
    end
  end

  describe '#decryptor' do
    it ' reverses the encrypted message' do
      enigma = Enigma.new
      shifter = Shifter.new
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]

      allow(enigma.shifter).to receive(:offset).and_return([02,27,71,15])
      allow(enigma.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
      allow(enigma.shifter).to receive(:shifter_set).and_return([3,27,73,20])
      message = "keder ohulw"
      message2 = "keder ohulw!"
      message3 = "KeDEr OHulW!?"

      expect(enigma.decryptor(message, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("hello world")
      expect(enigma.decryptor(message2, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("hello world!")
      expect(enigma.decryptor(message3, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("hello world!?")

    end
  end
end
