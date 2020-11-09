handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

cap_text = incoming_text.upcase

writer = File.open(ARGV[1], "w")

writer.write(cap_text)

writer.close
puts "Created  #{'ARVG[1]'} containing #{cap_text.count} characters"
