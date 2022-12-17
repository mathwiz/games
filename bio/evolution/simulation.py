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

