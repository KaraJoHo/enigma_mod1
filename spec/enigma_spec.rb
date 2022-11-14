require 'rspec'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  # it 'has a shifter object' do
  #   enigma = Enigma.new
  #   shifter = Shifter.new
  #
  #   expect(enigma.shifter).to be_a(Shifter)
  # end

  it 'has a cryptor object' do
    cryptor = Cryptor.new
    #shifter = Shifter.new

    expect(cryptor.shifter).to be_a(Shifter)
    expect(cryptor).to be_a(Cryptor)
  end

  # it 'has an encrypt message object' do
  #   cryptor = Cryptor.new
  #   encrypt_message = EncryptMessage.new
  #   shifter = Shifter.new
  #
  #   expect(encrypt_message.shifter).to be_a(Shifter)
  #   expect(encrypt_message).to be_a(EncryptMessage)
  # end

  describe '#encrypted_message' do
    xit 'encrypts a message from the encrypt message class' do
      enigma = Enigma.new
      cryptor = Cryptor.new
      encrypt_message = EncryptMessage.new
      shifter = Shifter.new
      the_date = "040895"
      the_key = "02715"
      expected_flattened = [2,27,71,15]
      expected_offset = [1,0,2,5]
      expect_shifter_set = [3,27,73,20]
      message = "hello world"

      # allow(encrypt_message.shifter).to receive(:offset).and_return([02,27,71,15])
      # allow(encrypt_message.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
      allow(encrypt_message.shifter).to receive(:set_date).and_return("040895")
      allow(encrypt_message.shifter).to receive(:key_generator).and_return("02715")
      allow(encrypt_message.shifter).to receive(:shifter_set).and_return([3,27,73,20])
      #allow(enigma).to receive(:encrypted_message).and_return("keder ohulw")
      expect(enigma.encrypted_message(message, expect_shifter_set)).to eq("keder ohulw")
      #expect(enigma.encrypted_message(message, the_key, the_date)).to eq("keder ohulw")
    end
  end


  # describe '#encrypt' do
  #   xit 'puts the encryption details in a hash' do
  #     enigma = Enigma.new
  #     cryptor = Cryptor.new
  #     encrypt_message = EncryptMessage.new
  #     shifter = Shifter.new
  #     expected = {
  #                   encryption: "keder ohulw",
  #                   key: "02715",
  #                   date: "040895"
  #                 }
  #     arguments = ["hello world", "02715", "040895"]
  #
  #     allow(enigma.shifter).to receive(:set_date).and_return("040895")
  #     allow(enigma.shifter).to receive(:key_generator).and_return("02715")
  #
  #     #expect(expected[:encryption]).to eq("keder ohulw")
  #
  #     #expect(enigma.encrypt("hello world", "02715", "040895").class).to be_a(Hash)
  #     expect(expected[:encryption]).to eq("keder ohulw")
  #   end
  # end






  describe '#encrypt' do
    it 'puts the encryption details in a hash' do
      enigma = Enigma.new
      cryptor = Cryptor.new
      message = "hello world"
      key = "02715"
      date = "040895"
      encrypt_message = EncryptMessage.new(message, key, date)
      #require 'pry' ;binding.pry

      # allow(enigma.encrypt(message)).to receive(:message).and_return("hello world")
      # allow(enigma.encrypt(key)).to receive(:key).and_return("02715")
      # allow(enigma.encrypt(date)).to receive(:date).and_return("040895")

      expected = {:encryption => "keder ohulw", :key => "02715", :date => "040895"}
      #allow(enigma).to receive(:encrypt).and_return(expected)

      # allow(encrypt_message.shifter).to receive(:key_generator).and_return("02715")
      # allow(encrypt_message.shifter).to receive(:set_date).and_return("040895")
      # allow(encrypt_message).to receive(:message).and_return("hello world")
      # allow(encrypt_message).to receive(:encryption_result_set).and_return(expected)

      #
      # expect(encrypt_message.encryption_result_set).to eq(expected)

      #expect(enigma.encrypt("hello world", "02715", "040895")).to eq(encrypt_message.encryption_result_set)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)

    end
  end







  describe '#character_set' do
    it 'has an array of the alphabet' do
      enigma = Enigma.new

      expected_set = ("a".."z").to_a << " "
      expect(enigma.character_set).to eq(expected_set)
    end
  end

  xit 'has a date from shifter' do
    enigma = Enigma.new
    shifter = Shifter.new

    allow(enigma.shifter).to receive(:set_date).and_return("111122")
    expect(enigma.shifter.set_date).to eq("111122")
  end

  xit 'has offsets from shifter' do
    enigma = Enigma.new
    shifter = Shifter.new

    allow(enigma.shifter).to receive(:offset).and_return([8,8,8,4])
    expect(enigma.shifter.offset).to eq([8,8,8,4])
  end

  # it 'has a shifter set' do
  #   enigma = Enigma.new
  #   shifter = Shifter.new
  #
  #   allow(enigma.shifter).to receive(:offset).and_return([8,8,8,4])
  #   allow(enigma.shifter).to receive(:flatten_key_pairs).and_return([12, 23, 34, 45])
  #   expect(enigma.shifter.shifter_set(enigma.shifter.flatten_key_pairs, enigma.shifter.offset)).to eq([20, 31, 42, 49])
  # end

  # describe '#cipher' do
  #   it ' take a message and iterates over the character_set to return encrypted string' do
  #     enigma = Enigma.new
  #     shifter = Shifter.new
  #     expected_flattened = [2,27,71,15]
  #     expected_offset = [1,0,2,5]
  #
  #     allow(enigma.shifter).to receive(:offset).and_return([02,27,71,15])
  #     allow(enigma.shifter).to receive(:flatten_key_pairs).and_return([01,00,02,05])
  #     allow(enigma.shifter).to receive(:shifter_set).and_return([3,27,73,20])
  #
  #     message = "hello world"
  #     message2 = "hello World!"
  #     message3 = "HeLlO wOrlD!!"
  #
  #     expect(enigma.cipher(message, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw")
  #     expect(enigma.cipher(message2, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!")
  #     expect(enigma.cipher(message3, enigma.shifter.shifter_set(expected_flattened, expected_offset))).to eq("keder ohulw!!")
  #   end
  # end

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
