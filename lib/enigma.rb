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

  def last_four_date (date = set_date)
    last_four_digits = []
    format = square_date.to_s[-4..-1].to_i
    last_four_digits << format
  end
end
