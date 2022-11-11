class Enigma

  def character_set
    ("a".."z").to_a << " "
  end

  def key_generator
    (0..9).to_a.sample(5).join('')
  end
end
