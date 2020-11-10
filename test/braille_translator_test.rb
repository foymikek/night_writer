require "minitest/autorun"
require "minitest/pride"
require "./lib/braille_translator"

class BrailleTranslatorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    braille_translator = BrailleTranslator.new
    assert_instance_of BrailleTranslator, braille_translator
    expected = {
      ["0....."]=>"a",
      ["0.0..."]=>"b",
      ["00...."]=>"c",
      ["00.0.."]=>"d",
      ["0..0.."]=>"e",
      ["000..."]=>"f",
      ["0000.."]=>"g",
      ["0.00.."]=>"h",
      [".00..."]=>"i",
      [".000.."]=>"j",
      ["0...0."]=>"k",
      ["0.0.0."]=>"l",
      ["00..0."]=>"m",
      ["00.00."]=>"n",
      ["0..00."]=>"o",
      ["000.0."]=>"p",
      ["00000."]=>"q",
      ["0.000."]=>"r",
      [".00.0."]=>"s",
      [".0000."]=>"t",
      ["0...00"]=>"u",
      ["0.0.00"]=>"v",
      [".000.0"]=>"w",
      ["00..00"]=>"x",
      ["00.000"]=>"y",
      ["0..000"]=>"z",
      ["......"]=>" "
    }
    assert_equal expected, braille_translator.dictionary_inverted
  end

  def test_linear_braille
    braille_translator = BrailleTranslator.new
    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = "0.00..0..0..0.0.0.0.0.0.0..00........000.00..00.0.000.0.0.0.00.0.."
    assert_equal expected, braille_translator.linear_braille(input)
  end

  def test_braille_symbol_count
    braille_translator = BrailleTranslator.new
    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal 11, braille_translator.braille_symbol_count(input)
  end

  def test_isolate_braille_symbols
    braille_translator = BrailleTranslator.new
    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]
    assert_equal expected, braille_translator.seperate_braille(input)
  end

  def test_translator_can_nest_braille_symbols
    braille_translator = BrailleTranslator.new
    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    expected = [["0.00.."], ["0..0.."], ["0.0.0."], ["0.0.0."], ["0..00."], ["......"], [".000.0"], ["0..00."], ["0.000."], ["0.0.0."], ["00.0.."]]
    assert_equal expected, braille_translator.nest_braille_symbols(input)
  end

  def test_translate
    braille_translator = BrailleTranslator.new

    input = "0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n"
    assert_equal "hello world", braille_translator.translate(input)
  end

end
