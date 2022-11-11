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
end
