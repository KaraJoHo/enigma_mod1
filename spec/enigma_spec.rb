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

  it 'has a cryptor object' do
    enigma = Enigma.new
    cryptor = Cryptor.new

    expect(enigma.cryptor).to be_a(Cryptor)
  end

  describe '#encrypt' do
    it 'puts the encryption details in a hash' do
      enigma = Enigma.new
      cryptor = Cryptor.new
      message = "hello world"
      key = "02715"
      date = "040895"
      encrypt_message = EncryptMessage.new(message, key, date)
      #require 'pry' ;binding.pry

      expected = {:encryption => "keder ohulw", :key => "02715", :date => "040895"}

      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)

    end
  end

  describe '#decryptor' do
    xit ' reverses the encrypted message' do
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
