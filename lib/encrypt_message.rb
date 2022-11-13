require './lib/shifter'
require './lib/cryptor'
require 'date'
class EncryptMessage < Cryptor
  attr_reader :key, :date, :message, :shifter, :character_set

  def initialize(message, key = nil, date = nil)
    @shifter = Shifter.new
    @message = message
    @generate_key = @shifter.key_generator
    @key = (@generate_key if key == nil) || key
    #require 'pry' ;binding.pry
    @date = (@shifter.set_date if date == nil) || date
    @character_set = ("a".."z").to_a << " "
  end

  def encryption_result_set
    final_set = {}
    #require 'pry' ;binding.pry
    final_set[:encryption] = cipher_message
    final_set[:key] = @key
    final_set[:date] = @date
    final_set
  end

  def cipher_message
    cipher(@message, @shifter.shifter_set(@key, @date))
  end

end
