require './lib/enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

encrypted = enigma.encrypt(message.chomp, "02715", "040895")

file = File.open(ARGV[1], "w")
file.write(encrypted[:encryption])
file.close

puts "Creates '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
