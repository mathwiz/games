class Model {
  def dice, shouldEnd, result, current
  def final Integer FACES = 6

  Model(Object... args) {
    dice = [new Die(FACES), new Die(FACES)]
    shouldEnd = false
    current = 1
  }

  def eval(String exp) {
    if (exp =~ '\\s*[Yy]\\s*') {
      current++
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
    "Rolling..."
  }

  def getPostAction() {
    result
  }

  def shoot() {
    dice[0].roll() + dice[1].roll()
  }
}
