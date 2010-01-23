#Analyze the ConwayEngine

require 'benchmark'
require_relative '../lib/ConwayEngine.rb'
require_relative '../lib/Grid.rb'


if __FILE__ == $0
 
  freshConwayEngine = ConwayEngine.new(120,50)
  benchmark = true 
  runs = 100
  repeats = 10
  
  bm_results = []
  
  if benchmark
    repeats.times do
      freshConwayEngine = ConwayEngine.new(120,50)
      bm_results << Benchmark.measure {  runs.times {freshConwayEngine.iterate()} } 
    end
  end
  
  result = 0
  bm_results.each do |entry|
    result += entry.real
  end
  
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
    if $DEBUG
    
    puts "before: size, height: #{freshConwayEngine.grid.cells.size}, #{freshConwayEngine.height}"
    puts "before: first.size, width: #{freshConwayEngine.grid.cells.first.size}, #{freshConwayEngine.width}"
    
    freshConwayEngine.grid.cells=Grid.convertFromBooleanGridtoCellGrid!(ten_cell_row)

    puts "after: size, height: #{freshConwayEngine.grid.cells.size}, #{freshConwayEngine.height}"
    puts "after: first.size, width: #{freshConwayEngine.grid.cells.first.size}, #{freshConwayEngine.width}"

  
    p ten_cell_row.object_id
    print " ?= "
    p freshConwayEngine.grid.cells.object_id
    end
  tick = 0
  while true do
    freshConwayEngine.printCells(freshConwayEngine)
    puts "Just did #{runs} ticks repeated #{repeats} times, which took #{result} secs. We're running about #{(repeats*runs) / result} ticks/sec @ #{freshConwayEngine.width}x#{freshConwayEngine.height}" if benchmark
    puts "Tick #{tick} \nPress 'Q' to quit, return to continue" # TODO fix runs number: seperate runs & repeats in benchmark from the actual generation/tick count. count in ConwayEngine?
    input = gets
    break if "Q\n" == input
    freshConwayEngine.iterate()
    system("clear")
    tick += 1
  end
  
end
