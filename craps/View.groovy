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
