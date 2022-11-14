require './lib/enigma'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read
file.close

decrypted = enigma.decrypt(message.chomp, ARGV[2], ARGV[3])

file = File.open(ARGV[1], "w")
file.write(decrypted[:decryption])
file.close

puts "Creates '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
