require "./lib/dictionary"

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end
end
