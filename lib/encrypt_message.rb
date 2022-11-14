require './lib/shifter'
require './lib/cryptor'
require 'date'
class EncryptMessage < Cryptor
  attr_reader :key, :date, :message, :shifter, :character_set

  def initialize(message, key = Shifter.new.key_generator, date = Shifter.new.set_date)
    @shifter = Shifter.new
    @message = message
    @key = key
    @date = date
    @character_set = ("a".."z").to_a << " "
  end

  def encryption_result_set
    final_set = {}
    final_set[:encryption] = cipher_message
    final_set[:key] = @key
    final_set[:date] = @date
    final_set
  end

  def cipher_message
    cipher(@message, @shifter.shifter_set(@key, @date))
  end
end
