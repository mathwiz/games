require './samplespace.rb'

class Doors
    def initialize
        randomizer = SampleSpaceWithoutReplacement.new([true, false, false])
        @left = randomizer.next
        @center = randomizer.next
        @right = randomizer.next
    end

    def isWinner(door)
        if door == 1
            hasPrize = @left
        elsif door == 2
            hasPrize = @center
        else
            hasPrize = @right
        end
        hasPrize
    end
    
    def getAlternatives(doorNum)
        if doorNum == 1
            sampler = SampleSpaceWithoutReplacement.new([2,3])
        elsif doorNum == 2
            sampler = SampleSpaceWithoutReplacement.new([1,3])
        else
            sampler = SampleSpaceWithoutReplacement.new([1,2])
        end
        sampler
    end
    
    def openOtherDoor(currentChoice)
        alternatives = getAlternatives(currentChoice)
        alt = alternatives.next
        if self.isWinner(currentChoice)
            openDoor = alt
        else
            openDoor = self.isWinner(alt) ? alternatives.next : alt
        end
        openDoor
    end
end #Doors


class Chooser
    attr_reader :firstChoice
    
    def initialize
        @options = SampleSpaceWithoutReplacement.new([1,2,3]) 
        @firstChoice = @options.next
    end
    
    def secondAfterOpening(door)
        candidate = @options.next
        candidate == door ? @options.next : candidate
    end
end #Chooser


class Play
    def initialize(switch)
        @doors = Doors.new
        @chooser = Chooser.new
        @doSwitch = switch
    end

    def makeChoice
        if @doSwitch
            firstChoice = @chooser.firstChoice
            openDoor =  @doors.openOtherDoor(firstChoice)
            @choice = @chooser.secondAfterOpening(openDoor)
        else
            @choice = @chooser.firstChoice
        end
        @choice
    end
    
    def win?
        @doors.isWinner(@choice)
    end
end #Play


class Simulation
    attr_accessor :wins

    def initialize(trials, switch)
        @trials = trials
        @doSwitch = switch
        @wins = 0
    end
    
    def run
        @trials.times do
            play = Play.new @doSwitch
            play.makeChoice
            @wins = @wins + (play.win? ? 1 : 0) 
        end    
    end
    
end #Simulation

puts '* Monty Hall Simulation *'

trials = 10000

printf("# Running simulation with %d trials without switch.\n", trials)
stay = Simulation.new(trials, false)
stay.run
printf("There were %d wins without switch!\n", stay.wins)

printf("# Running simulation with %d trials with switch.\n", trials)
switch = Simulation.new(trials, true)
switch.run
printf("There were %d wins with switch!\n", switch.wins)
