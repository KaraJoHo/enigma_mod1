require './lib/shifter'
require './lib/cryptor'
require './lib/encrypt_message'

RSpec.describe EncryptMessage do
  xit 'exists and is a child of cryptor' do
    encrypt_message = EncryptMessage.new

    expect(encrypt_message).to be_a(EncryptMessage)
    expect(EncryptMessage < Cryptor).to eq(true)
  end

  describe '#cipher' do
  xit ' take a message and iterates over the character_set to return encrypted string' do
      cryptor = Cryptor.new
      encrypt_message = EncryptMessage.new
      shifter = Shifter.new
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]

      allow(encrypt_message.shifter).to receive(:offset).and_return([02,27,71,15])
      allow(encrypt_message.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
      allow(encrypt_message.shifter).to receive(:shifter_set).and_return([3,27,73,20])

      message = "hello world"
      message2 = "hello World!"
      message3 = "HeLlO wOrlD!!"

      expect(encrypt_message.cipher(message, encrypt_message.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw")
      expect(encrypt_message.cipher(message2, encrypt_message.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!")
      expect(encrypt_message.cipher(message3, encrypt_message.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!!")
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
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]

      # key = "02715"
      # date = "040895"
      message = "hello world"
      encrypt_message = EncryptMessage.new(message)
      allow(encrypt_message.shifter).to receive(:key_generator).and_return("02715")
      allow(encrypt_message.shifter).to receive(:set_date).and_return("040895")
      allow(encrypt_message).to receive(:message).and_return("hello world")



      # message3 = "HeLlO wOrlD!!"
      expect(encrypt_message.cipher_message).to eq("keder ohulw")

      message2 = "hello World!"
      encrypt_message = EncryptMessage.new(message2)
      allow(encrypt_message.shifter).to receive(:key_generator).and_return("02715")
      allow(encrypt_message.shifter).to receive(:set_date).and_return("040895")

      allow(encrypt_message).to receive(:message).and_return("hello World!")
      expect(encrypt_message.cipher_message).to eq("keder ohulw!")


    end
  end

  describe '#encryption_result_set' do
    it 'returns a hash of information used to encrypt message' do
      cryptor = Cryptor.new
      shifter = Shifter.new
      message = "hello world"
      encrypt_message = EncryptMessage.new(message, "02715", "040895")

      allow(encrypt_message.shifter).to receive(:key_generator).and_return("02715")
      allow(encrypt_message.shifter).to receive(:set_date).and_return("040895")
      allow(encrypt_message).to receive(:message).and_return("hello world")

      expected = {:encryption => "keder ohulw", :key => "02715", :date => "040895"}
      #allow(encrypt_message).to receive(:encryption_result_set).and_return(expected)
      expect(encrypt_message.encryption_result_set).to eq(expected)
    end
  end
end
