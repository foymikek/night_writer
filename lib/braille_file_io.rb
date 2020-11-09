class BrailleFileIo
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def read
    handle = File.open(@input, "r")
    raw_text = handle.read.chomp
    handle.close
    @input = raw_text
  end

  def write
    output = File.open(@output, "w")
    count = output.write(BrailleTranslator.new.braille_translator(@input_text))
    puts "Created #{@output} containing #{count} characters."
    output.close
  end
end
