class Controller {
  def model, view

  def display() {
    view.show_state()
    view.show_prompt()
  }

  def start(args) {
    model = new Model(args)
    view = new View(model)

    display()

    def exp
    while (exp = System.console().readLine()) {
      view.show_pre_action()
      model.eval(exp)
      view.show_proccessing_action()
      view.show_post_action()
      if (model.getShouldEnd()) { break }
      display()
    }
  }

}

class View {
  Model model

  View(Model model) {
    this.model = model
  }

  def show_prompt() {
    print "Shoot? [y/N] "
  }

  def show_state() {
    println "Chamber $model.current of $model.chambers"
  }

  def show_pre_action() {
    if (model.getPreAction()) {
      println "$model.preAction"
    }
  }

  def show_proccessing_action() {
    if (model.getProcessingAction()) {
      println "$model.processingAction"
    }
  }

  def show_post_action() {
    println "$model.postAction"
  }
}

class Model {
  def loaded, current, chambers, shooting, shouldEnd, result

  Model(Object... args) {
    def shots = Integer.parseInt(args[0])
    loaded = Math.abs(new Random().nextInt() % shots)
    chambers = (1..shots).collect { it == loaded }
    current = 0
    shouldEnd = false
    shooting = false
  }

  def eval(String exp) {
    if (exp =~ '\\s*[Yy]\\s*') {
      shooting = true
      if (isOut()) {
        result = "The gun is empty. Did you load it?"
        shouldEnd = true
      } else if (shoot()) {
        result = "Bang!! You're dead!"
        shouldEnd = true
      } else {
        result = "Whew! No bullet."
      }
    } else {
      shooting = false
      result = "Chicken! Game ended."
      shouldEnd = true
    }
  }

  def getShouldEnd() {
    shouldEnd
  }

  def getPreAction() {
    ""
  }

  def getProcessingAction() {
    shooting ? "Shooting..." : ""
  }

  def getPostAction() {
    result
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


// run with groovy Loop.groovy number
println "Script called with args: " + args
def loop = new Controller()
loop.start(args)
