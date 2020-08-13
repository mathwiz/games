class SampleSpaceWithReplacement
    def initialize(data)
        @data = data
    end

    def next
        if @data.empty?
            raise "no values exist in the sample space"
        end
        @data[rand @data.size]
    end    
    
    def nextBatch(number)
        #return the number of elements from sample space
        elements = []
        number.times { elements.push(self.next) }
        elements
    end
    
    def empty?
        @data.empty?
    end
    
    def size
        @data.size
    end
end #SampleSpaceWithReplacement


class SampleSpaceWithoutReplacement < SampleSpaceWithReplacement
    def next
        if @data.empty?
            raise "no values exist in the sample space"
        end
        @data.delete_at(rand @data.size)
    end
end #SampleSpaceWithoutReplacement


# ss = SampleSpaceWithReplacement.new [ 1, 2, 3 ]
# 5.times { puts ss.next }
# 5.times { puts ss.nextBatch(4).to_s }

ss = SampleSpaceWithoutReplacement.new [ 1, 2, 3 ]
# 5.times { puts ss.next }
# 2.times { puts ss.nextBatch(2).to_s }

puts '* Monty Hall Simulation'

