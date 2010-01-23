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
require_relative 'Grid'
require_relative 'Cell'

#TODO: private functions - but what about the unit tests??
#FIX: x/y in 2d array...
attr_accessor :grid
#Create a new ConwayEngine. Pass width and height of the cell world
def initialize(width, height)
  @grid   = Grid.new(width, height)
end

def width()
  @grid.width
end

def height()
  @grid.height
end

 
def printCells(conway_engine)
  array = conway_engine.grid.cells #TODO catch 'npe'
  array.each do |row|
    row.each do |cell|
      print "o" if cell.alive?
      print "." if !cell.alive? 
    end
     print "\n"
  end
end
# calculate the generation n+1 
def iterate()
   new_cells = Array.new(self.height, Cell.new(false)).map!{ Array.new(self.width,Cell.new(false)) }
   puts "before: new: #{new_cells.object_id}, instance: #{@grid.cells.object_id}"
   
   @grid.cells.each_with_index do |row, y|
     if(y > 0 and y <self.height-1) #leave border out
       row.each_with_index do |entry, x|
         if(x > 0 and x < self.width-1) #leave border out
           neighbor_count = count_neighbors(y,x,@grid.cells)
           new_cells[y][x] = evolve(entry, neighbor_count)
             puts "in the middle: new: #{new_cells.object_id}, instance: #{@grid.cells.object_id}"
 
         end
       end
     end
   end
   @grid.cells = new_cells.clone
   puts "after: new: #{new_cells.object_id}, instance: #{@grid.cells.object_id}"

=begin
 new_cells = Array.new(@grid.cells.size,Cell.new(false)).map!{ Array.new(@grid.cells.first.size,Cell.new(false)) }
   @grid.cells.each_with_index do |row, y|
     if(y > 0 and y <@grid.cells.size-1) #leave border out
       row.each_with_index do |entry, x|
         if(x > 0 and x < row.size-1) #leave border out
           neighbor_count = count_neighbors(y,x,@grid.cells)
           new_cells[y][x] = evolve(entry, neighbor_count)
         end
       end
     end
   end
   @grid.cells = new_cells.clone
=end
end


#Count the neighbors of a 2d orthogonal grid. Uses the concept of the N_8(P)-neighborhood (Moore-neighborhood)
def count_neighbors(x,y,cells) #TODO: tell don't ask!
  counter=0
  counter += 1 if cells[x+1][y-1].alive?
  counter += 1 if cells[x+1][y].alive?  
  counter += 1 if cells[x+1][y+1].alive?
  counter += 1 if cells[x][y+1].alive?
  counter += 1 if cells[x-1][y+1].alive?
  counter += 1 if cells[x-1][y].alive?
  counter += 1 if cells[x-1][y-1].alive?
  counter += 1 if cells[x][y-1].alive?

  counter
end
#determine the n+1 state of a single cell according to it's neighbors count
def evolve(cell, neighbors)
  new_cell = cell
  if cell.alive?
    case
    when neighbors < 2
      new_cell.alive = false #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    when neighbors > 3
      new_cell.alive = false #  2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    when (neighbors == 2 or neighbors == 3)
      new_cell.alive = true #  3. Any live cell with two or three live neighbours lives on to the next generation.
    end
  elsif !cell.alive?
    if neighbors == 3
     new_cell.alive = true # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    end
  end
  new_cell
end


end


  
