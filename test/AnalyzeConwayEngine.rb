#Analyze the ConwayEngine

require 'benchmark'
require_relative '../lib/ConwayEngine.rb'

if __FILE__ == $0
 
  freshConwayEngine = ConwayEngine.new(120,50)
  benchmark = true 
  runs = 100
  repeats = 10
  
  bm_results = []
  
  if benchmark
    repeats.times do
      bm_results << Benchmark.measure {  runs.times {freshConwayEngine.iterate()} } 
    end
  end
  
  result = 0
  bm_results.each do |entry|
    result += entry.real
  end
  
  
  
  while true do
    freshConwayEngine.printCells(freshConwayEngine.cells)
    puts "Just did #{runs} ticks repeated #{repeats} times, which took #{result} secs. We're running about #{(repeats*runs) / result} ticks/sec" unless runs==0
    puts "Tick #{runs} \nPress 'Q' to quit, return to continue" # TODO fix runs number: seperate runs & repeats in benchmark from the actual generation/tick count. count in ConwayEngine?
    input = gets
    break if "Q\n" == input
    freshConwayEngine.iterate()
    system("clear")
    runs += 1
  end
  
end
