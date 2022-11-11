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
    message.each_char.with_index do |character, i|

    lower_char = character.downcase
    if character_set.include?(lower_char)
      char_idx = character_set.index(lower_char)
      shift = shifter[i % shifter.length]

      new_index = (char_idx + shift) % character_set.length

      if (char_idx + shift) < 27
        translated_message << character_set[new_index]
      else
        translated_message << character_set[(new_index) % character_set.length]
      end
        #require 'pry' ;binding.pry
    else
      translated_message << character
    end
  end
  translated_message
end

end
