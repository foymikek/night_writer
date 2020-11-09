require "minitest/autorun"
require "minitest/pride"
require "./lib/braille_file_io"

class BrailleFileIoTest < Minitest::Test
  def test_it_exists
    input = "braille.txt"
    output = "message.txt"
    night_reader = BrailleFileIo.new(input, output)
    assert_instance_of BrailleFileIo, night_reader
    require "pry"; binding.pry
  end

end
