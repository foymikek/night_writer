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
    writer.write(character_guard)
    writer.close
    puts "Created #{@output} containing #{@input.length} characters"
  end

  def character_guard
    @input.scan(/.{1,80}/).map do |text|
      Translator.new.translate(text)
    end.join("\n")
  end

end
