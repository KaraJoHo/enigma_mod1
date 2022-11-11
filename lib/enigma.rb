require 'date'
class Enigma

  def character_set
    ("a".."z").to_a << " "
  end

  def key_generator
    (0..9).to_a.sample(5).join('')
  end

  def key_pair_generator(key = key_generator)
    paired_keys = []
    key_generator.each_cons(2) do |key|
      paired_keys << key
    end
    paired_keys
  end

  def flatten_key_pairs(key = key_generator)
    key_pair_generator.flat_map do |key_pair|
      key_pair.join.to_i
    end
  end

  def set_date
    Date.today.strftime("%m%d%y")
  end

  def square_date(date = set_date)
    squared_date = set_date.to_i ** 2
  end

  def last_four_date(date = set_date)
    last_four_digits = []
    format = square_date.to_s[-4..-1].to_i
    last_four_digits << format
  end

  def offset(date = set_date)
    last_four_date.digits.reverse
  end

  def shifter_set(keys, offsets)
    key_nums = keys
    offset_nums = offsets
    final_shifter_set = []

    keys.each_with_index do |key, index|
      final_shifter_set << key_nums[index] + offset_nums[index].to_i
    end
    final_shifter_set
  end
  
end
