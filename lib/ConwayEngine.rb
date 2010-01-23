#logic for Conways game of life.
class ConwayEngine
=begin
The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, live or dead. Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

   1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
   2. Any live cell with more than three live neighbours dies, as if by overcrowding.
   3. Any live cell with two or three live neighbours lives on to the next generation.
   4. Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before). The rules continue to be applied repeatedly to create further generations.
=end
#TODO: private functions - but what about the unit tests??
  attr_accessor :cells
#Create a new ConwayEngine. Pass width and height of the cell world
def initialize(width=30, height=30, random=true, random_from=[true,false].to_a)
  #create an array 
  @cells = Array.new()
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
    @cells.push new_element
  end
  

  #draw border
  @cells[0]= Array.new(width,border)
  @cells[-1]= Array.new(width,border)
  
end

 
def printCells(array)
  array.each do |row|
    row.each do |element|
      print "o" if element == true
      print "." if element == false
    end
     print "\n"
  end
end
# calculate the generation n+1 
def iterate()
   new_cells = Array.new(@cells.size,false).map!{ Array.new(@cells.first.size,false) }
   @cells.each_with_index do |row, y|
     if(y > 0 and y <@cells.size-1) #leave border out
       row.each_with_index do |entry, x|
         if(x > 0 and x < row.size-1) #leave border out
           neighbor_count = count_neighbors(y,x,@cells)
           new_cells[y][x] = evolve(entry, neighbor_count)
         end
       end
     end
   end
   @cells = new_cells.clone
end


#Count the neighbors of a 2d orthogonal grid. Uses the concept of the N_8(P)-neighborhood (Moore-neighborhood)
def count_neighbors(x,y,cells) #TODO: tell don't ask!
  counter=0
  counter += 1 if cells[x+1][y-1]
  counter += 1 if cells[x+1][y]  
  counter += 1 if cells[x+1][y+1]
  counter += 1 if cells[x][y+1]
  counter += 1 if cells[x-1][y+1]
  counter += 1 if cells[x-1][y]
  counter += 1 if cells[x-1][y-1] 
  counter += 1 if cells[x][y-1]

  counter
end
#determine the n+1 state of a single cell according to it's neighbors count
def evolve(cell, neighbors)
  new_cell = cell
  if cell==true
    case
    when neighbors < 2
      new_cell = false #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    when neighbors > 3
      new_cell = false #  2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    when (neighbors == 2 or neighbors == 3)
      new_cell = true #  3. Any live cell with two or three live neighbours lives on to the next generation.
    end
  elsif cell==false
    if neighbors == 3
     new_cell = true # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    end
  end
  new_cell
end


end

if __FILE__ == $0
  
  ten_cell_row =[
    [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
    [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     ]
  
           ten_cell_row_next =[
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
     ]
  
  freshConwayEngine = ConwayEngine.new(120,50)
  #freshConwayEngine.cells = ten_cell_row

  
  runs = 500
  runs.times {freshConwayEngine.iterate()}
  while true do
    freshConwayEngine.printCells(freshConwayEngine.cells)
    puts "Tick #{runs} \nPress 'Q' to quit, return to continue"
    input = gets
    break if "Q\n" == input
    freshConwayEngine.iterate()
    system("clear")
    runs += 1
  end
  
end
