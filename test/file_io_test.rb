require "minitest/autorun"
require "minitest/pride"
require "./lib/file_io"

class FileIoTest < Minitest::Test
  def test_it_exists
    input = "message_test1.txt"
    output =  "dummy_test_file.txt"
    file_io = FileIo.new(input, output)
    assert_instance_of FileIo, file_io
  end

  def test_file_io_can_read_txt_file
    input = "message_test_z.txt"
    output = "dummy_test_file.txt"
    file_io = FileIo.new(input, output)
    assert_equal "this is saved to my input attribute", file_io.input
  end
# test both read and write

end
