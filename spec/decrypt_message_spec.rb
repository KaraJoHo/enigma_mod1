require './lib/shifter'
require './lib/cryptor'
require './lib/decrypt_message'

RSpec.describe DecryptMessage do
  it 'exists and is a child of cryptor' do
    message = "keder ohulw"
    decrypt_message = DecryptMessage.new(message)

    expect(decrypt_message).to be_a(DecryptMessage)
    expect(DecryptMessage < Cryptor).to eq(true)
  end

  it 'has attributes' do
    message = "keder ohulw"
    decrypt_message = DecryptMessage.new(message)

    expect(decrypt_message.message).to eq("keder ohulw")
  end

  describe '#cipher' do
  it ' take a message and iterates over the character_set to return encrypted string' do
      cryptor = Cryptor.new
      message = "keder ohulw"
      decrypt_message = DecryptMessage.new(message)
      shifter = Shifter.new
      expect(decrypt_message.cipher(message, shifter.shifter_set("02715", "040895"))).to eq("hello world")
    end
  end

  it 'exists with attributes' do
    cryptor = Cryptor.new
    shifter = Shifter.new
    message = "keder ohulw"
    decrypt_message = DecryptMessage.new(message)
  end

  describe '#cipher_message' do
    it 'can cipher a message' do
      cryptor = Cryptor.new
      shifter = Shifter.new

      message = "keder ohulw"
      decrypt_message = DecryptMessage.new(message, "02715", "040895")

      expect(decrypt_message.cipher_message).to eq("hello world")

      message2 = "keder ohulw!"
      decrypt_message = DecryptMessage.new(message2, "02715", "040895")

      expect(decrypt_message.cipher_message).to eq("hello world!")
    end
  end

  describe '#decryption_result_set' do
    it 'returns a hash of information used to encrypt message' do
      cryptor = Cryptor.new
      shifter = Shifter.new
      message = "keder ohulw"
      decrypt_message = DecryptMessage.new(message, "02715", "040895")
      expected = {:decryption => "hello world", :key => "02715", :date => "040895"}

      expect(decrypt_message.decryption_result_set).to eq(expected)
    end
  end
end
