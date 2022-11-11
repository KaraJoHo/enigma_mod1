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
end
