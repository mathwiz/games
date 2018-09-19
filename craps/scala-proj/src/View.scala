package craps

class View(var model: Model) {

  def welcome = {
    println("Welcome to Craps!")
  }

  def prompt = {
    print("Throw? [y/N] ")
  }

  def state = {
    println("Roll: " + model.roll)
  }

  def vertical_space = {
    println("")
  }

  def display = {
    vertical_space
    state
    prompt
  }

  def pre_action = printIfExists(model.pre)

  def processing_action = printIfExists(model.processing, false)

  def post_action = printIfExists(model.post)

  def printIfExists(s: String, new_line: Boolean = true) : Unit = {
    if (s.length != 0) {
      if (new_line) {
        println(s)
      } else {
        print(s)
      }
    }
  }

}
