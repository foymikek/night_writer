require "./lib/dictionary"

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def sentence_to_letters(sentence_str)
    sentence_str.split(//)
  end

  def translate_sentence(letter_array)
    letter_array.map do |letter|
      char_translate(letter)
    end
  end

  def char_translate(eng_char_str)
    @dictionary[eng_char_str]
  end

  def braille_columns(input_message)
    translate_sentence(sentence_to_letters(input_message)).transpose
  end

  def stack_columns(input_message)
    braille_columns(input_message).map do |column|
      column.join(",") + "\n"
    end
  end

  def translate(input_message)
    braille_columns(input_message)
    stack_columns(input_message)
  end

end
