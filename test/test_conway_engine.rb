# To change this template, choose Tools | Templates
# and open the template in the editor.

# Netbeans created this - is that a kind of pre 1.9 require_relative??
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'conway_engine'

class TestConwayEngine < Test::Unit::TestCase
  def test_count_neighbors_full
    test_cells = [
    [true,true,true],
    [true,true,true],
    [true,true,true],
    ]
     assert_equal(8, ConwayEngine::count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_empty
      test_cells = [
    [false,false,false],
    [false,true,false],
    [false,false,false],
    ]
    assert_equal(0, ConwayEngine::count_neighbors(1,1, test_cells))
  end
  def test_count_neighbors_two
    test_cells = [
    [false,false,true],
    [false,false,false],
    [false,false,true],
    ]
    assert_equal(2, ConwayEngine::count_neighbors(1,1, test_cells))
  end

  def test_evolve_die
    cell = true
    #  1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
    assert_equal(false, ConwayEngine::evolve(cell,0))
    assert_equal(false, ConwayEngine::evolve(cell,1))
    #     2. Any live cell with more than three live neighbours dies, as if by overcrowding.
    assert_equal(false, ConwayEngine::evolve(cell,4))
    assert_equal(false, ConwayEngine::evolve(cell,5))
    assert_equal(false, ConwayEngine::evolve(cell,6))
    assert_equal(false, ConwayEngine::evolve(cell,7))
    assert_equal(false, ConwayEngine::evolve(cell,8))
  end
  def test_evolve_live
    # 3. Any live cell with two or three live neighbours lives on to the next generation.
    cell = true
    assert_equal(true, ConwayEngine::evolve(cell,2))
    assert_equal(true, ConwayEngine::evolve(cell,3))
    # 4. Any dead cell with exactly three live neighbours becomes a live cell.
    cell = false
    assert_equal(true, ConwayEngine::evolve(cell,3))

  end
end
