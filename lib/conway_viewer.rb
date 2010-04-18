# Viewer for Conway's game of Life models
module ConwayViewer
  #string representation of the cell grid
  def ConwayViewer.to_s(cells)
  cells.each do |row|
    row.each do |element|
      print "o " if element == true
      print ". " if element == false
    end
     print "\n"
    end
  end

 end
