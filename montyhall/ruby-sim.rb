require './samplespace.rb'

# ss = SampleSpaceWithReplacement.new [ 1, 2, 3 ]
# 5.times { puts ss.next }
# 5.times { puts ss.nextBatch(4).to_s }

ss = SampleSpaceWithoutReplacement.new [ 1, 2, 3 ]
# 5.times { puts ss.next }
2.times { puts ss.nextBatch(2).to_s }

puts '* Monty Hall Simulation'

