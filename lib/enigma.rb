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
end
