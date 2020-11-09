class BrailleFileIo
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def read
    handle = File.open(@input, "r")
    raw_braille = handle.read.chomp
    handle.close
    @input = raw_braille
  end

  def organize_message
    text = (BrailleFileIo.new.translate(@input))
    text.scan(/.{1,80}/)+"\n"
  end
end
