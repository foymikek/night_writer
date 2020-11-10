require "./lib/dictionary"

class BrailleTranslator
  attr_reader :dictionary_inverted

  def initialize
    @dictionary_inverted = Dictionary.new.invert
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

  def nest_braille_symbols(input)
    seperate_braille(input).map do |braille_symbol|
      [braille_symbol]
    end
  end

  def translate(input)
     nest_braille_symbols(input).map do |braille|
      @dictionary_inverted[braille]
    end.join("")
  end
end
