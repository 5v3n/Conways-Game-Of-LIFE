=begin
The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, live or dead. Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

   1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
   2. Any live cell with more than three live neighbours dies, as if by overcrowding.
   3. Any live cell with two or three live neighbours lives on to the next generation.
   4. Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before). The rules continue to be applied repeatedly to create further generations.
=end
module ConwayEngine
    def ConwayEngine.iterate(cells)
       new_cells = Array.new(cells.size,false).map!{ Array.new(cells.first.size,false) }
       cell_size = cells.size
       cells.each_with_index do |row, y|
         if(y > 0 and y <cell_size-1) #leave border out
           row.each_with_index do |entry, x|
             if(x > 0 and x < row.size-1) #leave border out
               neighbor_count = count_neighbors(y,x,cells)
               new_cells[y][x] = evolve(entry, neighbor_count)
             end
           end
         end
       end
       cells = new_cells.clone
    end
    #Count the neighbors of a 2d orthogonal grid. Uses the concept of the N_8(P)-neighborhood (Moore-neighborhood)
    def ConwayEngine.count_neighbors(x,y,cells) #TODO: tell don't ask!
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
    def ConwayEngine.evolve(cell, neighbors)
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

