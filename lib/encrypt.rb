require './lib/enigma'

file = File.open(ARGV[0], "r")
message = file.read
file.close

encrypted = enimga.encrypt(message.chomp, "02715", "040895") #decrypt is (message, ARGV[2], ARGV[3])

file = File.open(ARGV[1], "w")
file.write(encrypt_message[:encryption])
file.close

puts "Creates '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
