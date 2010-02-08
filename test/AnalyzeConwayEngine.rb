#Analyze the ConwayEngine

require 'benchmark'
require '../lib/ConwayEngine.rb'


if __FILE__ == $0
  repeats = 3
  # use benchmark with custom results: total & average time
  Benchmark.benchmark(" "*25 + Benchmark::CAPTION, 25, Benchmark::FMTSTR, ">avg small", ">avg big", ">tps small", ">tps big") do |x|
    bmConwayEngine = ConwayEngine.new(120,50)
    label_small = "#{bmConwayEngine.width}x#{bmConwayEngine.height}, #{repeats} times"
    t_small = x.report(label_small)   do
      repeats.times {bmConwayEngine.iterate()}
    end
    
    
    
    bmConwayEngine = ConwayEngine.new(1200,500)
    label_big="#{bmConwayEngine.width}x#{bmConwayEngine.height}, #{repeats} times"
    t_big = x.report(label_big)   do
      repeats.times {bmConwayEngine.iterate()}
    end
    
    avg_small = t_small / repeats
    avg_big   = t_big / repeats
    #tps_small = repeats * (1.0 / t_small)
    #tps_big   = repeats / t_big 
    
    [avg_small, avg_big]#, tps_small, tps_big]
    
    # divide result with FixNum works, but not vice versa...

   end

  
 
   
  
end
