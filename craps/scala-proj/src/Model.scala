package craps

class Model(var roll: Int = 1, 
            var should_end: Boolean = false, 
            var result: String = "no roll") {

  def eval(exp: String): Unit = {
    if (exp == "y" || exp == "Y") {
      roll += 1
      result = "" + (roll_dice)
    } else {
      result = "Game ended."
      should_end = true
    }
  }

  def roll_dice = roll_die + roll_die

  def roll_die = 1 + Math.abs(new java.util.Random().nextInt() % 6)

  def pre = ""

  def processing = if (should_end) "" else "Rolling..."

  def post = result
}
