#Analyze the ConwayEngine

require 'benchmark'
require_relative '../lib/ConwayEngine.rb'


if __FILE__ == $0
 
  freshConwayEngine = ConwayEngine.new(100,50)
  bmConwayEngine = ConwayEngine.new(120,50)
  benchmark = true
  runs = 10
  repeats = 2
  
  bm_results = []
  
  if benchmark
    repeats.times do
      bmConwayEngine = ConwayEngine.new(1200,500)
      bm_results << Benchmark.measure {  runs.times {bmConwayEngine.iterate()} } 
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
   
  tick = 0
  while true do
    freshConwayEngine.printCells(freshConwayEngine.cells)
    puts "Just did #{runs} ticks repeated #{repeats} times, which took #{result} secs. We're running about #{(repeats*runs) / result} ticks/sec @ #{bmConwayEngine.cells.first.size}x#{bmConwayEngine.cells.size}" if benchmark
    puts "Tick #{tick} \nPress 'Q' to quit, return to continue" # TODO fix runs number: seperate runs & repeats in benchmark from the actual generation/tick count. count in ConwayEngine?
    input = gets
    break if "Q\n" == input
    freshConwayEngine.iterate()
    system("clear")
    tick += 1
  end
  
end
