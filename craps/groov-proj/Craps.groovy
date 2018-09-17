class Controller {
  def model, view, init_objects

  Controller() {
    this([])
  }

  Controller(Object... args) {
    init_objects = args
  }

  def display() {
    view.show_state()
    view.show_prompt()
  }

  def start() {
    model = new Model(init_objects)
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
