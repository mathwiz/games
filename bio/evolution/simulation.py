import random
from rna import *
from primemachine import *

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

def simulate():
  pass
