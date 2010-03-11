#Conway's game of Life
class GameOfLife

  require_relative 'conway_engine'
  require_relative 'conway_model'
  require_relative 'conway_viewer'

  include ConwayEngine
  include ConwayModel
  include ConwayViewer

  #Create a new ConwayEngine. Pass width and height of the cell world
  def initialize(width=30, height=30, random=true, random_from=[true,false].to_a)
    #create an array
    create_grid(width, height, random, random_from)
  end
  def start
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
  app.start
end

