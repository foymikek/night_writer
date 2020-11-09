require "minitest/autorun"
require "minitest/pride"
require "./lib/file_io"

class FileIoTest < Minitest::Test
  def test_it_exists_and_has_attribtues
    file_io = FileIo.new("abc", "cba")
    assert_equal "abc", file_io.input
    assert_equal "cba", file_io.output
  end
end
