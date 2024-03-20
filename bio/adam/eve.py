import core as core
import random

class Simulation:
  def __init__(self, pop, gens):
    self.pop = pop
    self.gens = gens

  def run(self):
    for x in range(self.gens):
      print(gender())


class Animal:
  def __init__(self, id, mom, dad, gender):
    self.id = id
    self.mom = mom
    self.dad = dad
    self.gender = gender


def gender():
  return random.choice([0,1])


def procreate(mom, dad):
  pass
