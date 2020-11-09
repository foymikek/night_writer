require "./lib/dictionary"

class BrailleTranslator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end
end
