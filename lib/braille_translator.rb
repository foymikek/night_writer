require "./lib/dictionary"

class BrailleTranslator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new.braille_index
  end

  def linear_braille(input)
    columns = input.split("\n")
    braille_segments = []
    braille_symbol_count(input).times do
     columns.each do |string|
       braille_segments << [string.slice!(0..1)]
     end
   end
   braille_segments.join
  end

  def braille_symbol_count(input)
    (input.split[0].length)/2
  end

  def seperate_braille(input)
    linear_braille(input).scan(/.{6}/)
  end

end
