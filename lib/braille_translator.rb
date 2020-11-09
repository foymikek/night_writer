require "./lib/dictionary"

class BrailleTranslator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def linear_braille(stacked_braille)
    columns = stacked_braille.split("\n")
    braille_segments = []
    braille_symbol_count(stacked_braille).times do
     columns.each do |string|
       braille_segments << [string.slice!(0..1)]
     end
   end
   braille_segments.join
  end

  def braille_symbol_count(stacked_braille)
    (stacked_braille.split[0].length)/2
  end

end
