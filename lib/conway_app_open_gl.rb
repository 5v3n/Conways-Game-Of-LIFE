#Conway's game of Life
class GameOfLife

  require File.join(File.dirname(__FILE__),  'conway_engine')
  require File.join(File.dirname(__FILE__),  'conway_model')
  require File.join(File.dirname(__FILE__),  'conway_viewer_open_gl')
 
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

  #start the Game of Life
  def start
    ConwayViewerOpenGL::to_gl(self.cells)
  end
  #TODO how about a step() method?
  #TODO think about... if start()/stop()/step() belong to the conway_app, or the conway_engine

end

if $0 == __FILE__
  width = 200
  height = 150
  width = ARGV[0].to_i unless ARGV[0] == nil
  height = ARGV[1].to_i unless ARGV[1] == nil
  app = GameOfLife.new(width, height)
  app.start
end

