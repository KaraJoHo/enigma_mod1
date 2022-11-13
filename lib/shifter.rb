class Shifter

  def key_generator
    key_gen = (0..9).to_a.sample(5).join('')
  end

  def prep_key(key = key_generator)
    prep_key = key.split('')
    prepare_key = prep_key.map {|key_elem| key_elem.to_i}
  end

  def key_pair_generator(key = key_generator)
    paired_keys = []
    #prep_key = key_generator.split('')
    #prepare_to_pair = prep_key.map {|key_elem| key_elem.to_i}
    #prepare_to_pair.each_cons(2) do |key|
    prep_key.each_cons(2) do |key|
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
    #last_four_digits = []
    format = square_date.to_s[-4..-1].to_i
    format
    #require 'pry' ;binding.pry
    #last_four_digits << format
    #last_four_digits
  end

  def offset(date = set_date)
    offset_num = last_four_date.digits.reverse
  end

  def shifter_set (keys = key_generator, date = set_date)
    key_nums = flatten_key_pairs(keys)

     final_shifter_set = []

     key_nums.each_with_index do |key, idx|
       #require 'pry' ;binding.pry
      final_shifter_set << key_nums[idx] + offset[idx]
     end
     final_shifter_set
  end
end
