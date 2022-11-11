require 'rspec'
require 'date'
require './lib/shifter'

RSpec.describe Shifter do
  it 'exists' do
    shifter = Shifter.new

    expect(shifter).to be_a(Shifter)
  end

  describe '#key_generator' do
    it ' generates a random set of 5 numbers' do
      shifter = Shifter.new

      expect(shifter.key_generator.length).to eq(5)
    end
  end

  describe '#key_pair_generator' do
    xit 'combines the random number into pairs' do
      enigma = Enigma.new

      allow(enigma).to receive(:key_generator).and_return([0,1,2,3,4])

      expected_pairs = [[0,1], [1,2], [2,3], [3,4]]

      expect(enigma.key_pair_generator).to eq(expected_pairs)

    end
  end

  describe '#flatten_key_pairs' do
    xit 'flattens the key pairs from an array into an array of 4 integers' do
      enigma = Enigma.new

      allow(enigma).to receive(:key_generator).and_return([1,2,3,4,5])

      expected_pairs = [[1,2], [2,3], [3,4], [4,5]]

      expect(enigma.key_pair_generator).to eq(expected_pairs)

      expected_flattened = [12, 23, 34, 45]

      expect(enigma.flatten_key_pairs).to eq(expected_flattened)
    end
  end

  describe '#set_date' do
    xit 'sets the date and formats it' do
      enigma = Enigma.new

      expect(enigma.set_date).to eq(Date.today.strftime("%m%d%y"))
      enigma.set_date == 111122

      expect(enigma.set_date).to eq("111122")
    end
  end

  describe '#square_date' do
    xit 'squares the date value' do
      enigma = Enigma.new

      expect(enigma.set_date).to eq(Date.today.strftime("%m%d%y"))
      enigma.set_date == 111122

      expect(enigma.set_date).to eq("111122")

      expect(enigma.square_date).to eq(12348098884)
    end
  end

  describe '#last_four_date' do
    xit 'gets the last 4 digits of the squared date' do
        enigma = Enigma.new

        expect(enigma.set_date).to eq(Date.today.strftime("%m%d%y"))
        enigma.set_date == 111122

        expect(enigma.set_date).to eq("111122")

        enigma.square_date
        expect(enigma.last_four_date).to eq([8884])
    end
  end

  describe '#offset' do
    xit 'sets the final format of the date to the offset' do
      enigma = Enigma.new

      allow(enigma).to receive(:set_date).and_return("111122")
      allow(enigma).to receive(:square_date).and_return(12348098884)
      allow(enigma).to receive(:last_four_date).and_return(8884)
      expect(enigma.offset).to eq([8,8,8,4])
    end
  end

  describe '#shifter_set' do
    xit 'combines the keys and offset to make final shifter set' do
      enigma = Enigma.new

      expected_flattened = [12, 23, 34, 45]
      expected_offset = [8,8,8,4]

      allow(enigma).to receive(:flatten_key_pairs).and_return(expected_flattened)
      allow(enigma).to receive(:offset).and_return(expected_flattened)

      expect(enigma.shifter_set(expected_flattened, expected_offset)).to eq([20, 31, 42, 49])
    end
  end
end
