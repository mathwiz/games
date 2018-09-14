import java.util.Random
import java.util.Scanner
import java.io.InputStream
import scala.util.control.Breaks._


class Game(var shots: Int) {
  val gun = new Gun(shots)

  val in = new Scanner(System.in)

  def show_prompt() {
    println("Shooting " + gun.current_chamber + " of " + gun.chambers);
    //println(gun.revolver);
    print("Shoot? [y/N] ")
  }

  def start() {
    println("Shooting up to " + gun.chambers);
    //println("Bullet in " + gun.loaded);
    show_prompt();
    breakable {
      while (in.hasNext()) {
        val exp = in.next();
        if (exp == "y" || exp == "Y") {
          println("Shooting..."); 
          gun.shoot;
          if (gun.fired) {
            println("Bang! You're dead!"); break
          } else {
            println("Whew! No bullet.")
          }
        } else {
          println("Chicken! Ending game."); break
        }
        show_prompt()
      }
    }
  }
}

class Gun(var shots: Int) {
  val loaded = Math.abs(new Random().nextInt() % shots)

  val revolver = (0 until shots).map(x => x == loaded)

  var current = 0

  def chambers = revolver.size

  def fired : Boolean = revolver(current - 1)

  def shoot {
    current = current + 1
  }

  def current_chamber = current + 1
}

object Main extends App {
  val game = new Game(6)
  game.start()
}
