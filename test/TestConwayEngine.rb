#Unit tests for the ConwayEngine

require_relative '../lib/ConwayEngine.rb'
require_relative '../lib/Grid.rb'
require 'test/unit'

class TestConwayEngine < Test::Unit::TestCase
    HEIGHT=50
    WIDTH=120
  
  def test_initialize

    
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    assert_equal(freshConwayEngine.height, 50)
    assert_equal(freshConwayEngine.width, 120)
  end

  def test_count_neighbors_full
    test_cells = [
    [true,true,true],
    [true,true,true],
    [true,true,true], 
    ]
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    Grid.convertFromBooleanGridtoCellGrid!(test_cells)
    #freshConwayEngine.grid.cells = test_cells
    assert_equal(8, freshConwayEngine.count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_empty
      test_cells = [
    [false,false,false],
    [false,true,false],
    [false,false,false], 
    ]
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    Grid.convertFromBooleanGridtoCellGrid!(test_cells)
    #freshConwayEngine.cells = test_cells
    assert_equal(0, freshConwayEngine.count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_two
    test_cells = [
    [false,false,true],
    [false,false,false],
    [false,false,true], 
    ]
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    Grid.convertFromBooleanGridtoCellGrid!(test_cells)
    #freshConwayEngine.cells = test_cells
    assert_equal(2, freshConwayEngine.count_neighbors(1,1, test_cells))
  end

  def test_evolve_die
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    cell = Cell.new(true)
    #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=0).alive?)
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=1).alive?)
    #     2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=4).alive?)
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=5).alive?)
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=6).alive?)
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=7).alive?)
    assert_equal(false, freshConwayEngine.evolve(cell.neighbors=8).alive?)
  end
  def test_evolve_live
    freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
    # 3. Any live cell with two or three live neighbours lives on to the next generation.
    cell = Cell.new(true)
    assert_equal(true, freshConwayEngine.evolve(cell.neighbors=2).alive?)
    assert_equal(true, freshConwayEngine.evolve(cell.neighbors=3).alive?)
    # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    cell = Cell.new(false)
    assert_equal(true, freshConwayEngine.evolve(cell.neighbors=3).alive?)

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
      
      freshConwayEngine = ConwayEngine.new(WIDTH, HEIGHT)
      Grid.convertFromBooleanGridtoCellGrid!(ten_cell_row)
      Grid.convertFromBooleanGridtoCellGrid!(ten_cell_row_next)    
      freshConwayEngine.grid.cells = ten_cell_row
      freshConwayEngine.iterate()
      assert_equal(freshConwayEngine.grid.cells, ten_cell_row_next)
      
      
  end

end
