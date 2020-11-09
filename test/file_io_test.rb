require "minitest/autorun"
require "minitest/pride"
require "./lib/file_io"

class FileIoTest < Minitest::Test
  def test_it_exists_and_has_attribtues
    file_io = FileIo.new("abc", "cba")
    assert_equal "abc", file_io.input
    assert_equal "cba", file_io.output
  end

  def test_file_io_can_read_txt_file
    input = "message_test1.txt"
    output   = "dummy_test_file.txt"
    file_io = FileIo.new(input, output)
    file_io.read
    assert_equal "this is saved to my input attribute", file_io.input
  end
end
