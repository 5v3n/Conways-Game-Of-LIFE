#Unit tests for the ConwayEngine

require_relative '../lib/conway_app.rb'
require 'test/unit'

class TestConwayEngine < Test::Unit::TestCase
  def test_initialize
    x=60
    y=90
    freshConway = GameOfLife.new()
    assert_equal(freshConway.cells.size, 30)
    assert_equal(freshConway.cells[0].size, 30)
    
    freshConway = GameOfLife.new(x,y)
    assert_equal(freshConway.cells.size, y)
    assert_equal(freshConway.cells[0].size, x)
  end

  def test_count_neighbors_full
    test_cells = [
    [true,true,true],
    [true,true,true],
    [true,true,true], 
    ]
    freshConwayEngine = GameOfLife.new()
    freshConwayEngine.cells = test_cells
    assert_equal(8, freshConwayEngine.count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_empty
      test_cells = [
    [false,false,false],
    [false,true,false],
    [false,false,false], 
    ]
          freshConwayEngine = GameOfLife.new()
    freshConwayEngine.cells = test_cells
    assert_equal(0, freshConwayEngine.count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_two
    test_cells = [
    [false,false,true],
    [false,false,false],
    [false,false,true], 
    ]
    freshConwayEngine = GameOfLife.new()
    freshConwayEngine.cells = test_cells
    assert_equal(2, freshConwayEngine.count_neighbors(1,1, test_cells))
  end

  def test_evolve_die
    freshConwayEngine = GameOfLife.new()
    cell = true
    #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    assert_equal(false, freshConwayEngine.evolve(cell,0))
    assert_equal(false, freshConwayEngine.evolve(cell,1))
    #     2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    assert_equal(false, freshConwayEngine.evolve(cell,4))
    assert_equal(false, freshConwayEngine.evolve(cell,5))
    assert_equal(false, freshConwayEngine.evolve(cell,6))
    assert_equal(false, freshConwayEngine.evolve(cell,7))
    assert_equal(false, freshConwayEngine.evolve(cell,8))
  end
  def test_evolve_live
    freshConwayEngine = GameOfLife.new()
    # 3. Any live cell with two or three live neighbours lives on to the next generation.
    cell = true
    assert_equal(true, freshConwayEngine.evolve(cell,2))
    assert_equal(true, freshConwayEngine.evolve(cell,3))
    # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    cell = false
    assert_equal(true, freshConwayEngine.evolve(cell,3))

  end
  def test_iterate
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
      
      freshConwayEngine = GameOfLife.new()
      freshConwayEngine.cells = ten_cell_row
      freshConwayEngine.iterate()
      assert_equal(freshConwayEngine.cells, ten_cell_row_next)
      
      
  end

end
