class View {
  Model model

  View(Model model) {
    this.model = model
  }

  def show_prompt() {
    print "Roll? [y/N] "
  }

  def show_state() {
    println "Roll: $model.current"
  }

  def show_pre_action() {
    if (model.getPreAction()) {
      println "$model.preAction"
    }
  }

  def show_processing_action() {
    if (model.getProcessingAction()) {
      println "$model.processingAction"
    }
  }

  def show_post_action() {
    println "$model.postAction"
  }
}
