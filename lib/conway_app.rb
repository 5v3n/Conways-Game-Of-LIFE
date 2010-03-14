#Conway's game of Life
class GameOfLife

  require_relative 'conway_engine'
  require_relative 'conway_model'
  require_relative 'conway_viewer'
 
#  include ConwayEngine
#  include ConwayModel
#  include ConwayViewer

  attr_accessor :cells, :height, :width


  #Create a new GameOfLife.
  #
  #Pass width and height of the cell world, whether it should be filled with random life & the seed to generate the life from
  #
  #
  def initialize(width=30, height=30, random=true, random_seed=[true,false].to_a)

    @width=width
    @height=height

    #create an array
    @cells = ConwayModel::create_grid(width, height, random, random_seed)
  end
  def iterate()
    @cells=ConwayEngine::iterate(self.cells)
  end
  #start the Game of Life
  def start
    tick = 1
    while true do
      ConwayViewer::to_s(self.cells)
      puts "Tick #{tick} \nPress 'Q' to quit, return to continue"
      input = STDIN.gets
      break if "Q\n" == input
      iterate()
      system("clear")
      tick += 1
    end

  end
  #TODO how about a step() method?
  #TODO think about... if start()/stop()/step() belong to the conway_app, or the conway_engine

end

if $0 == __FILE__
  width = 30
  height = 30
  width = ARGV[0].to_i unless ARGV[0] == nil
  height = ARGV[1].to_i unless ARGV[1] == nil
  app = GameOfLife.new(width, height)
  app.start
end

