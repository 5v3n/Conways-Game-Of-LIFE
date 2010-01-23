# a grid for Conway's game of LIFE
class Grid
  attr_accessor :cells, :width, :height
  def initialize(width=120, height=50, random=true)
    @width=width
    @height=height
    @cells = Array.new()
    
    random_seed = [true,false]
    border = false
    
    #add 'height' arrays of size 'width'
    @height.times do
      if random # fill it with random arrays   
        new_element =  (0...@width).map{Cell.new(random_seed[rand(random_seed.size)])} #random choice out of `random_seed`
        #fill  borders 
        new_element[0]=Cell.new(border)
        new_element[-1]=Cell.new(border)
      else # fill it overcrowded
        new_element = Array.new(@width, Cell.new(border)) # fill it with arrays 
        new_element[1...-1]=Array.new(new_element.size-2,Cell.new(true)) #fill borders
      end
      @cells.push new_element
    end
  
    #draw border
    @cells[0]= Array.new(@width,Cell.new(border))
    @cells[-1]= Array.new(@width,Cell.new(border))
    @cells
  end
  def cells=(new_cells)
    @cells=new_cells
    @height=@cells.size
    @width=@cells.first.size  
  end
  # Helper method converts 2d arrays of boolean values to Cell object 2d arrays
  def self.convertFromBooleanGridtoCellGrid(boolean_grid)
    boolean_grid.clone.each{|row| row.map! { |entry| entry = Cell.new(entry)}}
  end
  # Helper method converts & overwrites 2d arrays of boolean values to Cell object 2d arrays
  def self.convertFromBooleanGridtoCellGrid!(boolean_grid)
    boolean_grid.each{|row| row.map! { |entry| entry = Cell.new(entry)}}
  end
end
