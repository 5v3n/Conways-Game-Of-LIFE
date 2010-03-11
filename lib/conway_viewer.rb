# Viewer for Conway's game of Life models
module ConwayViewer
 def to_s(array=self.cells)
  array.each do |row|
    row.each do |element|
      print "o " if element == true
      print ". " if element == false
    end
     print "\n"
  end
end
end
