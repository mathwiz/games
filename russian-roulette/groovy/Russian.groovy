class Game {
  def gun

  def show_prompt() {
    //println "Bullet in $gun.loaded"
    println "Chamber $gun.current of $gun.chambers"
    print "Shoot? [y/N] "
  }

  def start(shots) {
    gun = new Gun(shots)

    println "Shooting $shots shots"
    show_prompt()
    
    def exp
    while (exp = System.console().readLine()) {
      if (exp =~ '\\s*[Yy]\\s*') {
        println "Shooting..."
        if (gun.isOut()) {
          println "The gun is empty. Did you load it?"
          break
        } else if (gun.shoot()) {
          println "Bang!! You're dead!"
          break
        } else {
          println "Whew! No bullet."
        }
      } else {
        println "Chicken! Game ended."
        break
      }
      show_prompt()
    }
  }

}

class Gun {
  def loaded, current, chambers

  Gun(shots) {
    loaded = Math.abs(new Random().nextInt() % 6)
    chambers = (1..shots).collect { it == loaded }
    current = 0
  }

  def shoot() {
    def fire = !isOut() && chambers[current]
    current = isOut() ? current : current + 1
    fire
  }
  def getCurrent() {
    current + 1
  }

  def getChambers() {
    chambers.size
  }

  def getLoaded() {
    loaded + 1
  }

  def isOut() {
    current > getChambers() - 1
  }
}

class Main {
  def static main(String... args) {
    def g = new Game()
    g.start(6)
  }
}

Main.main(null)
