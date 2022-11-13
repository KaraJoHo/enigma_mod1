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

      allow(shifter).to receive(:key_generator).and_return("01234")

      expected_pairs = [[0,1], [1,2], [2,3], [3,4]]

      expect(shifter.key_pair_generator).to eq(expected_pairs)

    end
  end

  describe '#flatten_key_pairs' do
    it 'flattens the key pairs from an array into an array of 4 integers' do
      shifter = Shifter.new

      allow(shifter).to receive(:key_generator).and_return("12345")

      expected_pairs = [[1,2], [2,3], [3,4], [4,5]]

      expect(shifter.key_pair_generator).to eq(expected_pairs)

      expected_flattened = [12, 23, 34, 45]

      expect(shifter.flatten_key_pairs).to eq(expected_flattened)
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

      allow(shifter).to receive(:set_date).and_return("111122")

      expect(shifter.square_date).to eq(12348098884)
    end
  end

  describe '#last_four_date' do
    it 'gets the last 4 digits of the squared date' do
        shifter = Shifter.new

        allow(shifter).to receive(:set_date).and_return("111122")
        #allow(shifter).to receive(:square_date).and_return(12348098884)
        squared_date = 12348098884
        date = "111122"

        expect(shifter.last_four_date).to eq(8884)
    end
  end

  describe '#offset' do
    it 'sets the final format of the date to the offset' do
      shifter = Shifter.new

      allow(shifter).to receive(:set_date).and_return("111122")
      allow(shifter).to receive(:square_date).and_return(12348098884)
      allow(shifter).to receive(:last_four_date).and_return(8884)
      expect(shifter.offset).to eq([8,8,8,4])
    end
  end

  describe '#shifter_set' do
    xit 'combines the keys and offset to make final shifter set' do
      shifter = Shifter.new

      expected_flattened = [12, 23, 34, 45]
      expected_offset = [8,8,8,4]
      #
      allow(shifter).to receive(:flatten_key_pairs).and_return(expected_flattened)
      allow(shifter).to receive(:offset).and_return(expected_flattened)
      key = "12345"
      date = "111122"
      #
      shifter.offset(date)
      offset = [8,8,8,4]
      expect(shifter.shifter_set(key, date)).to eq([20, 31, 42, 49])

      expect(shifter.shifter_set(expected_flattened, expected_offset)).to eq([20, 31, 42, 49])
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
