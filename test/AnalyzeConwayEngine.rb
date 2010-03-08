#Analyze the ConwayEngine

require 'benchmark'
require '../lib/ConwayEngine.rb'

 def fps array
   array.map { |item| 1.0/item unless item==nil }
 end


if __FILE__ == $0
  repeats = 5
  repeats = ARGV[0].to_i if ARGV[0]

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
    # divide result with FixNum works, but not vice versa:
    #tps_small = repeats * (1.0 / t_small)
    #tps_big   = repeats / t_big

    fps_avg_small  = fps(avg_small.to_a)
    fps_avg_big    = fps(avg_big.to_a)

    puts "Average tps small" + " "*10 + "%07f" % fps_avg_small[1] + " "*23 + "(  %07f)" % fps_avg_small.last()
    puts "Average tps big  " + " "*10 + "%07f" % fps_avg_big[1]   + " "*23 + "(  %07f)" % fps_avg_big.last()

    [avg_small, avg_big]#, fps_avg_small, fps_avg_big]
    # TODO: format avg ticks per second properly
    # TODO: use .bmbm (ramping up included)

   end





end
