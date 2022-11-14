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

      expected = {:encryption => "keder ohulw", :key => "02715", :date => "040895"}

      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)

    end
  end

  describe '#decrypt' do
    it 'puts the encryption details in a hash' do
      enigma = Enigma.new
      cryptor = Cryptor.new
      message = "keder ohulw"
      key = "02715"
      date = "040895"
      encrypt_message = EncryptMessage.new(message, key, date)

      expected = {:decryption => "hello world", :key => "02715", :date => "040895"}

      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)

    end
  end
end
