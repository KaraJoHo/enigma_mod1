require 'date'
require './lib/shifter'
require './lib/encrypt_message'
require './lib/decrypt_message'
require './lib/cryptor'

class Enigma
  attr_reader :cryptor, :shifter

  def initialize
    @cryptor = Cryptor.new
    @shifter = Shifter.new
  end

  def encrypt(message, key = nil, date = nil)
    encrypt_message = EncryptMessage.new(message, key, date)
    encrypt_message.encryption_result_set
  end

  def decrypt(message, key = nil, date = nil)
    decrypt_message = DecryptMessage.new(message, key, date)
    decrypt_message.decryption_result_set
  end
end
