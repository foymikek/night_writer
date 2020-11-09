require './lib/translator'

class FileIo
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
    read
    write
  end

  def read
    handle = File.open(@input, "r")
    raw_text = handle.read.chomp
    handle.close
    @input = raw_text
  end

  def write
    writer = File.open(@output, "w")
    writer.write(Translator.new.translate(@input))
    writer.close
    puts "Created #{@output} containing #{@input.length} characters"
  end

end
