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

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    #require 'pry' ;binding.pry
    @encrypt_message = EncryptMessage.new(message, key, date)
    @encrypt_message.encryption_result_set
  end


  # def encrypted_message(message, shifter)
  #   #require 'pry' ;binding.pry
  #   @translated << @encrypt_message.cipher(message, shifter) #@shifter.shifter_set(@shifter.flatten_key_pairs, @shifter.set_date))
  #   @translated.pop
  # end


  # def encrypt(message, key = @shifter.key_generator, date = @shifter.set_date)
  #
  #   {
  #
  #     :encryption => @translated,
  #     :key => key,
  #     :date => date
  #   }

  # end

  # def cipher(message, shifter)
  #   translated_message = ''
  #   message = message.downcase
  #
  #   message.each_char.with_index do |character, i|
  #     if character_set.include?(character)
  #       char_idx = character_set.index(character)
  #       shift = shifter[i % shifter.length]
  #       new_index = (char_idx + shift) % character_set.length
  #
  #       if new_index < character_set.length
  #         translated_message << character_set[new_index]
  #       else
  #         translated_message << character_set[(new_index) % character_set.length]
  #       end
  #     else
  #       translated_message << character
  #     end
  #   end
  #     translated_message
  # end

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
