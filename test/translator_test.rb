require "minitest/autorun"
require "minitest/pride"
require "./lib/translator"
require "./lib/dictionary"

class TranslatorTest < Minitest::Test
  def test_it_exists_and_has_attributes
    translator = Translator.new
    assert_instance_of Translator, translator
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
    assert_equal expected, translator.dictionary
  end

  def test_translator_can_translate_eng_char_to_braille
    translator = Translator.new
    assert_equal ["0.", "..", ".."], translator.char_translate("a")
  end

  def test_translator_can_split_phrase_into_letters
    translator = Translator.new
    expected = ['a', 'b', 'c', ' ', 'd', 'e', 'f', ' ', 'g', 'h']
    assert_equal expected, translator.sentence_to_letters("abc def gh")
  end

  def test_tranlator_can_translate_a_sentence
    translator = Translator.new
    expected = [["0.", "..", ".."], ["0.", "0.", ".."], ["..", "..", ".."], ["00", ".0", ".."]]
    assert_equal expected, translator.translate_sentence(["a", "b", " ", "d"])
  end

  def test_translator_can_stack_sentence_into_columns
    translator = Translator.new
    expected = [["0.", "0.", "..", "00"], ["..", "0.", "..", ".0"], ["..", "..", "..", ".."]]
    assert_equal expected, translator.braille_columns("ab d")
  end

  def test_tranlator_can_stack_braille_columns
    translator = Translator.new

    expected = ["0.,0.,..,00\n", "..,0.,..,.0\n", "..,..,..,..\n"]
    assert_equal expected, translator.stack_columns("ab d")
  end

  def test_tranlator_can_display_columns
    translator = Translator.new
    expected = "0.0...00\n..0....0\n........\n"
    assert_equal expected, translator.display_columns("ab d")
  end

end
