#Conway's game of Life
class GameOfLife

  require 'conway_engine'
  require 'conway_model'
  require 'conway_viewer'

  include ConwayEngine
  include ConwayModel
  include ConwayViewer

  #TODO: private functions - but what about the unit tests??
  attr_accessor :cells, :height, :width
  #Create a new ConwayEngine. Pass width and height of the cell world
  def initialize(width=30, height=30, random=true, random_from=[true,false].to_a)
    #create an array
    @cells = Array.new()
    @height= height
    @width = width
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
  def run
    tick = 1
    while true do
    to_s()
    puts "Tick #{tick} \nPress 'Q' to quit, return to continue"
    input = STDIN.gets
    break if "Q\n" == input
    iterate()
    system("clear")
    tick += 1
  end

  end

end

if $0 == __FILE__
  width = 80
  height = 50
  width = ARGV[0].to_i unless ARGV[0] == nil
  height = ARGV[1].to_i unless ARGV[1] == nil
  app = GameOfLife.new(width, height)
  app.run
end

