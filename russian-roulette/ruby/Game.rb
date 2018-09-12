class Gun
  def initialize(chambers)
    @loaded = rand(0..(chambers-1))
    @chambers = (0..(chambers-1)).collect { |it| it == @loaded }
    @current = 0
  end

  def shoot
    fire = !self.out? && @chambers[@current]
    @current = self.out? ?  @current : @current + 1
    fire
  end

  def out?
    @current > @chambers.size - 1
  end

  def chamber
    @current + 1
  end

  def chambers
    @chambers.size
  end

  def loaded
    @loaded + 1
  end
end

class Game
  def initialize(shots)
    @prompt = "Shoot? [y/N] "
    @gun = Gun.new(shots)
  end

  def show_status
    #print "#{@gun.loaded} "
    print "Chamber #{@gun.chamber} of #{@gun.chambers}"
    print "\n"
  end

  def run()
    self.show_status
    print @prompt
    while exp = gets.chomp
      case exp
      when /\s*[Yy]\s*/
        print "Shooting...\n"
        if @gun.out?
          print "The gun is empty. Did you load it?\n"
          break
        elsif @gun.shoot
          print "Bang!...You're dead!\n"
          break
        else
          print "Whew! No bullet.\n"
        end
      else
        print "Chicken! Game ended.\n"
        break
      end
      self.show_status
      print @prompt
    end
  end
end

Game.new(6).run
