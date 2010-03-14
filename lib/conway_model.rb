# Cell grid for Conway's game of Life
module ConwayModel
 def ConwayModel.create_grid(width=30, height=30, random=true, random_from=[true,false].to_a)
    cells = Array.new()
    border = false

 #add 'height' arrays of size 'width'
    height.times do
      if random # fill it with random arrays
        new_element =  (0...width).map{random_from[rand(random_from.size)]} #random cohoice between [true,false]

        #fill  borders
        new_element[0]=border
        new_element[-1]=border
      else # fill it with overcrowded
        new_element = Array.new(width, border) # fill it with arrays
        new_element[1...-1]=Array.new(new_element.size-2,true) #fill orders
      end
      cells.push new_element
    end
       #draw border
    cells[0]= Array.new(width,border)
    cells[-1]= Array.new(width,border)
    cells
 end
end
