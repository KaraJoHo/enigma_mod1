require 'rspec'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  describe '#character_set' do
    it 'has an array of the alphabet' do
      enigma = Enigma.new

      expected_set = ("a".."z").to_a << " "
      expect(enigma.character_set).to eq(expected_set)
    end
  end

  describe '#key_generator' do
    it ' generates a random set of 5 numbers' do
      enigma = Enigma.new

      expect(enigma.key_generator.length).to eq(5)
    end
  end

  describe '#key_pair_generator' do
    it 'combines the random number into pairs' do
      enigma = Enigma.new

      allow(enigma).to receive(:key_generator).and_return([0,1,2,3,4])

      expected_pairs = [[0,1], [1,2], [2,3], [3,4]]

      expect(enigma.key_pair_generator).to eq(expected_pairs)

    end
  end

  describe '#flatten_key_pairs' do
    it 'flattens the key pairs from an array into an array of 4 integers' do
      enigma = Enigma.new

      allow(enigma).to receive(:key_generator).and_return([1,2,3,4,5])

      expected_pairs = [[1,2], [2,3], [3,4], [4,5]]

      expect(enigma.key_pair_generator).to eq(expected_pairs)

      expected_flattened = [12, 23, 34, 45]

      expect(enigma.flatten_key_pairs).to eq(expected_flattened)
    end
  end
end
