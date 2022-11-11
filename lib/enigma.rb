class Enigma

  def character_set
    ("a".."z").to_a << " "
  end

  def key_generator
    (0..9).to_a.sample(5).join('')
  end

  def key_pair_generator
    paired_keys = []
    key_generator.each_cons(2) do |key|
      paired_keys << key
    end
    paired_keys
  end
end
