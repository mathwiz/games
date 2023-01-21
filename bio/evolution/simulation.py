import random
from rna import *
from prime import *

def prime_fitness(tape):
  return fitness(tape, prime_tape())

def fitness(tape, target):
  if len(target) == 0:
    return 0
  num = 1
  correct = 0
  for i, x in enumerate(target):
    if i == len(tape):
      break
    correct += 1 if tape[i] == x else 0
  return correct / len(target)

def is_match(test, target):
  for i in range(len(test)):
    if target[i] != test[i]:
      return False
  return True

def simulate_rna(target, limit = 10000):
  for i in range(1, limit+1):
    if is_match(randbases(len(target)), target):
      return i
  return -1

def crossover_point(length, prob):
  for i in range(length):
    if random.random() < prob:
      return i
  return 0

#TODO: make multiple crossover points possible
def crossover(a, b, pos):
  c = []
  d = []
  crossed = False
  for i in range(max(len(a), len(b))):
    if not crossed:
      crossed = i == pos
    first = b if crossed else a
    second = a if crossed else b
    if i < len(first):
      c.append(first[i])
    if i < len(second):
      d.append(second[i])
  return (c, d)

def crossover_uniform(a, b, rate):
  pass

def reproduce(mom, dad):
  pos = crossover_point(max(len(mom), len(dad)), .01)
  return crossover(mom, dad, pos)

def mutate(seq):
  pass

def simulate(n, gens):
  pass

class Population():
  def __init__(self, n, length):
    self.individuals = []
    for i in range(n):
      self.individuals.append(randbases(length))
    self.fits = {}

  def find_fits(self, target):
    for x in self.individuals:
      self.find_fit(x, target)

  def find_fit(self, program, target):
    individual = Machine(program)
    key = str(individual)
    if not key in self.fits:
      individual.exec()
      self.fits[key] = fitness(individual.tape, target)

  def reproduce(self):
    pass

  def __str__(self):
    return f"Population size {len(self.individuals)}"
