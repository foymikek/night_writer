require "./lib/dictionary"

class BrailleTranslator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def linear_braille(stacked_braille)
    braille_char_count = (stacked_braille.split[0].length)/2
    columns = stacked_braille.split("\n")
    braille_segments = []
    braille_char_count.times do
     columns.each do |string|
       braille_segments << [string.slice!(0..1)]
     end
   end
   braille_segments.join
  end

end
