require "./lib/dictionary"

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def translate(eng_char_str)
    @dictionary[eng_char_str]
  end

  def sentence_to_letters(sentence_str)
    sentence_str.split(//)
  end

end
