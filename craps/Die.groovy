class Die {
  def faces

  Die(Integer num) {
    faces = num
  }

  def roll() {
    1 + Math.abs(new Random().nextInt() % faces)
  }
}
