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
    it 'combines the random number into pairs' do
      shifter = Shifter.new

      expected_pairs = [[0,1], [1,2], [2,3], [3,4]]

      expect(shifter.key_pair_generator("01234")).to eq(expected_pairs)

    end
  end

  describe '#flatten_key_pairs' do
    it 'flattens the key pairs from an array into an array of 4 integers' do
      shifter = Shifter.new

      expected_pairs = [[1,2], [2,3], [3,4], [4,5]]

      expect(shifter.key_pair_generator("12345")).to eq(expected_pairs)

      expected_flattened = [12, 23, 34, 45]

      expect(shifter.flatten_key_pairs("12345")).to eq(expected_flattened)
    end
  end

  describe '#set_date' do
    it 'sets the date and formats it' do
      shifter = Shifter.new

      allow(shifter.set_date).to receive(:set_date).and_return(Date.today.strftime("%m%d%y"))
      shifter.set_date == Date.today.strftime("%m%d%y")

      expect(shifter.set_date).to eq(Date.today.strftime("%m%d%y"))
    end
  end

  describe '#square_date' do
    it 'squares the date value' do
      shifter = Shifter.new

      expect(shifter.square_date("111122")).to eq(12348098884)
    end
  end

  describe '#last_four_date' do
    it 'gets the last 4 digits of the squared date' do
        shifter = Shifter.new

        squared_date = 12348098884
        date = "111122"

        expect(shifter.last_four_date("111122")).to eq(8884)
    end
  end

  describe '#offset' do
    it 'sets the final format of the date to the offset' do
      shifter = Shifter.new

      expect(shifter.offset("111122")).to eq([8,8,8,4])
    end
  end

  describe '#shifter_set' do
    it 'combines the keys and offset to make final shifter set' do
      shifter = Shifter.new
      shifter.offset("111122")

      expect(shifter.shifter_set("12345", "111122")).to eq([20, 31, 42, 49])
    end
  end

  describe '#prep_key' do
    it 'splits the key to be used as an integer' do
      shifter = Shifter.new
      key = "12345"
      expect(shifter.prep_key(key)).to eq([1,2,3,4,5])
    end
  end
end
