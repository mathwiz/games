import core as core

class Simulation:
  def __init__(self, pop, gens):
    self.pop = pop
    self.gens = gens

  def run(self):
    for x in range(self.gens):
      print(x)


