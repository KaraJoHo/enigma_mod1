require './lib/shifter'
require './lib/cryptor'
require './lib/encrypt_message'

RSpec.describe EncryptMessage do
  it 'exists and is a child of cryptor' do
    message = "hello world"
    encrypt_message = EncryptMessage.new(message)

    expect(encrypt_message).to be_a(EncryptMessage)
    expect(EncryptMessage < Cryptor).to eq(true)
  end

  describe '#cipher' do
  it ' take a message and iterates over the character_set to return encrypted string' do
      cryptor = Cryptor.new
      message = "hello world"
      encrypt_message = EncryptMessage.new(message)
      shifter = Shifter.new
      expect(encrypt_message.cipher(message, shifter.shifter_set("02715", "040895"))).to eq("keder ohulw")
    end
  end

  it 'exists with attributes' do
    cryptor = Cryptor.new
    shifter = Shifter.new
    message = "hello world"
    encrypt_message = EncryptMessage.new(message)
  end

  describe '#cipher_message' do
    it 'can cipher a message' do
      cryptor = Cryptor.new
      shifter = Shifter.new

      message = "hello world"
      encrypt_message = EncryptMessage.new(message, "02715", "040895")

      # message3 = "HeLlO wOrlD!!"
      expect(encrypt_message.cipher_message).to eq("keder ohulw")

      message2 = "hello World!"
      encrypt_message = EncryptMessage.new(message2, "02715", "040895")

      expect(encrypt_message.cipher_message).to eq("keder ohulw!")
    end
  end

  describe '#encryption_result_set' do
    it 'returns a hash of information used to encrypt message' do
      cryptor = Cryptor.new
      shifter = Shifter.new
      message = "hello world"
      encrypt_message = EncryptMessage.new(message, "02715", "040895")
      expected = {:encryption => "keder ohulw", :key => "02715", :date => "040895"}

      expect(encrypt_message.encryption_result_set).to eq(expected)
    end
  end
end
