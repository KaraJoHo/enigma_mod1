require 'date'
require './lib/shifter'
class Enigma
  attr_reader :shifter

  def initialize
    @shifter = Shifter.new
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def cipher(message, shifter)
    translated_message = ''
    message = message.downcase

    message.each_char.with_index do |character, i|
      if character_set.include?(character)
        char_idx = character_set.index(character)
        shift = shifter[i % shifter.length]
        new_index = (char_idx + shift) % character_set.length

        if (char_idx + shift) < character_set.length
          translated_message << character_set[new_index]
        else
          translated_message << character_set[(new_index) % character_set.length]
        end
      else
        translated_message << character
      end
    end
      translated_message
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

        if (char_idx + shift) < reverse_character_set.length
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
