require "./lib/braille_translator"

class BrailleFileIo
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
    read
    write
  end

  def read
    handle = File.open(@input, "r")
    raw_braille = handle.read.chomp
    handle.close
    @input = raw_braille
  end

  def organize_message
    BrailleTranslator.new.translate(@input).scan(/.{1,80}/)+"\n"
  end

  def write
    output = File.open(@output, "w")
    count = output.write(BrailleTranslator.new.translate(@input))
    puts "Created '#{@output}' containing #{count} characters."
    output.close
  end
end
