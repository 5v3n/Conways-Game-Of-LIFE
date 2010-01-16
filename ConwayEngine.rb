#logic for Conways game of life.
=begin
The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, live or dead. Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

   1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
   2. Any live cell with more than three live neighbours dies, as if by overcrowding.
   3. Any live cell with two or three live neighbours lives on to the next generation.
   4. Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before). The rules continue to be applied repeatedly to create further generations.
=end


class ConwayEngine
  attr_reader :cells
#Create a new ConwayEngine. Pass width and height of the cell world
def initialize(width=30, height=30)
  #create an array with 'width' elements:
  @cells = Array.new(height)

  #draw border
  @cells[0]= Array.new(width,false)
  @cells[-1]= Array.new(width,false)
  
  for  i in 1...@cells.size-1
    new_element = Array.new(width, false) # fill it with arrays 
    new_element[1...-1]=Array.new(new_element.size-2,true) #fill with living cells but leave borders dead
    @cells[i] = new_element
  end
  @old_cell_state=@cells.clone
end
# calculate the generation n+1 
def iterate()
  @old_cell_state = @cells.clone
  y=0
  @cells.each do |row|
    x=0
    if(y>0 and y<@cells.size-1) #don't process the border
      row.each do |single_cell|
        #single_cell = ... # doesn't work, since single_cell is block local
        if (x > 0 and x < row.size-1) #don't process the border
          new_cell_state = evolve(single_cell, count_neighbors(x,y)) 
          @cells[x][y] = new_cell_state 
        end   
        x += 1
      end
    end
    y+=1
  end
end
def printCells
  @cells.each do |row|
    row.each do |element|
      print "*" if element
      print " " if not element
    end
     print "\n"
  end
end

private
#Count the neighbors of a 2d array. Uses the concept of the N_8(P)-neighborhood
def count_neighbors(x,y)
  counter=0
  counter += 1 if @cells[x-1][y]
  counter += 1 if @cells[x+1][y]
  counter += 1 if @cells[x][y-1]
  counter += 1 if @cells[x][y+1]
  counter += 1 if @cells[x-1][y-1]
  counter += 1 if @cells[x+1][y-1]
  counter += 1 if @cells[x-1][y+1]
  counter += 1 if @cells[x+1][y+1]
  counter
end
#determine the n+1 state of a single cell according to it's neighbors
def evolve(cell, neighbors)
  cell_is_alive=cell #if there's no matching condition, don't change the cell's state
  if cell==true
    case
    when neighbors < 2
      cell_is_alive = false #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    when neighbors > 3
      cell_is_alive = false #  2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    when (neighbors == 2 or neighbors == 3)
      cell_is_alive = true #  3. Any live cell with two or three live neighbours lives on to the next generation.
    end
  elsif cell==false
    if neighbors == 3
     cell_is_alive = true # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    end
  end 
  cell_is_alive  
end
#print the cells using '*' for alive and ' ' for dead cell

end

if __FILE__ == $0
  freshConwayEngine = ConwayEngine.new()
  freshConwayEngine.printCells
  10.times do
  freshConwayEngine.iterate()
  freshConwayEngine.printCells
  end
  
end
