require "./lib/dictionary"

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def translate(input_message)
    braille_columns(input_message)
    stack_columns(input_message)
    display_columns(input_message)
  end

  def braille_columns(input_message)
    # require "pry"; binding.pry
    translate_sentence(sentence_to_letters(input_message)).transpose
  end

  def translate_sentence(letter_array)
    letter_array.map do |letter|
      char_translate(letter)
    end
  end

  def char_translate(eng_char_str)
    @dictionary[eng_char_str]
  end

  def stack_columns(input_message)
    braille_columns(input_message).map do |column|
      column.join(",") + "\n"
    end
  end

  def display_columns(input_message)
    stack_columns(input_message).join("").gsub(",", "")
  end

  def sentence_to_letters(sentence_str)
    sentence_str.split(//)
  end

end
