class FileIo
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

end
