require './lib/shifter'
class Cryptor
  attr_reader :shifter, :character_set
  def initialize
    @shifter = Shifter.new
    @character_set = ("a".."z").to_a << " "
  end

  def cipher(message, shifter)
    translated_message = ''
    message = message.downcase

    message.each_char.with_index do |character, i|
      if @character_set.include?(character)
        char_idx = @character_set.index(character)
        shift = shifter[i % shifter.length]
        new_index = (char_idx + shift) % @character_set.length

        if new_index < @character_set.length
          translated_message << @character_set[new_index]
        else
          translated_message << @character_set[(new_index) % @character_set.length]
        end
      else
        translated_message << character
      end
    end
      translated_message
  end
end
