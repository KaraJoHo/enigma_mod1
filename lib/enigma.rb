require 'date'
require './lib/shifter'
require './lib/encrypt_message'
require './lib/cryptor'
class Enigma
  attr_reader :cryptor, :shifter

  def initialize
    @cryptor = Cryptor.new
    @shifter = Shifter.new
  end

  def encrypt(message, key = nil, date = nil)
    #require 'pry' ;binding.pry
    @encrypt_message = EncryptMessage.new(message, key, date)
    @encrypt_message.encryption_result_set
  end


  

  def decryptor(message, shifter)
    translated_message = ''
    message = message.downcase

    message.each_char.with_index do |character, i|
      reverse_character_set = character_set.reverse

      if character_set.include?(character)
        char_idx = reverse_character_set.index(character)
        shift = shifter[i % shifter.length]
        new_index = (char_idx + shift) % reverse_character_set.length

        if new_index < reverse_character_set.length
          translated_message << reverse_character_set[new_index]
        else
          translated_message << reverse_character_set[(new_index) % reverse_character_set.length]
        end
      else
        translated_message << character
      end
    end
      translated_message
  end
end
