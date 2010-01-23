# A Cell
class Cell
  attr_accessor :alive
 
  # A Cell can be dead or alive (true or false)
  def initialize(alive)
      @alive = alive
  end

  #checks if the cell is alive
  def alive?()
    @alive == true
  end
 
end
