require_relative '../lib/ConwayCellPatternCollection.rb'

if __FILE__ == $0
begin
  #test: does the converter work?
  p CellPatternCollection::GLIDER
  p CellPatternCollection.conway_converter(CellPatternCollection::GLIDER)
  puts "---------"
 
  #test: does the conway_converter! really work?
  glider = CellPatternCollection::GLIDER.dup
  p glider
  p CellPatternCollection.conway_converter!(glider)
  p glider
  p CellPatternCollection::GLIDER
  puts "---------"
  
   #test: are constants really "constant"?
  p CellPatternCollection::GLIDER
  p CellPatternCollection.conway_converter!(CellPatternCollection::GLIDER)
  rescue 
    puts puts "\"#{$!.class}: #{$!.message}\" thrown, AOK"
  end
  CellPatternCollection::GLIDER = "dfasg" #this really isn't good!
  p CellPatternCollection::GLIDER
  puts "---------"
  
end
