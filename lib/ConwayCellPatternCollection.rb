# a collection of pattern for Conway's game of life.
# syntax follows the Life Lexicon  (http://www.argentum.freeserve.co.uk/lex_home.htm)
class CellPatternCollection
  #-- TODO figure out how to use "real" constants!
  GLIDER = [
            "***",
            "*..",
            ".*."]
  GLIDER.freeze
  
  GOSPER_GLIDER_GUN = [
        "........................*...........",
	"......................*.*...........",
	"............**......**............**",
	"...........*...*....**............**",
	"**........*.....*...**..............",
	"**........*...*.**....*.*...........",
	"..........*.....*.......*...........",
	"...........*...*....................",
	"............**......................"
  ]
  GOSPER_GLIDER_GUN.freeze
  
  # converts an ascii cell pattern.
  # the input for a glider would be:
  #                 ["***",
  #                  "*..",
  #                  ".*."]
  #
  # and result in [["*", "*", "*"], ["*", ".", "."], [".", "*", "."]]
  def self.conway_converter(ascii_pattern_array)
    ascii_pattern_array.map do |entry|
      size=entry.length
      new_entry = []
      size.times {|i| new_entry << entry[i] }
      new_entry
      end
  end
  # same as CellPatternCollection::conway_converter, but changes the parameter
  def self.conway_converter!(ascii_pattern_array)
    ascii_pattern_array.replace(conway_converter(ascii_pattern_array))
  end
end