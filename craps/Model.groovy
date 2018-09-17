class Model {
  def dice, shouldEnd, result
  def final Integer FACES = 6

  Model(Object... args) {
    dice = [new Die(FACES), new Die(FACES)]
    shouldEnd = false
  }

  def eval(String exp) {
    if (exp =~ '\\s*[Yy]\\s*') {
      result = shoot() as String
    } else {
      result = "Ok! Game ended."
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
    shooting ? "Rolling..." : ""
  }

  def getPostAction() {
    result
  }

  def shoot() {
    dice[0].roll() + dice[1].roll()
  }
}
