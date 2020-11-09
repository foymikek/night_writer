require "minitest/autorun"
require "minitest/pride"
require "./lib/braille_translator"

class BrailleTranslatorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    braille_translator = BrailleTranslator.new
    assert_instance_of BrailleTranslator, braille_translator
    expected = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
      }
    assert_equal expected, braille_translator.dictionary
  end

  def test_linear_braille
    braille_translator = BrailleTranslator.new
    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = "0.00..0..0..0.0.0.0.0.0.0..00........000.00..00.0.000.0.0.0.00.0.."
    assert_equal expected, braille_translator.linear_braille(input)
  end

  def test_braille_symbol_count
    braille_translator = BrailleTranslator.new
    assert_equal 11, braille_translator.braille_symbol_count
  end

end
