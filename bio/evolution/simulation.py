import rna

def is_match(test, target):
  for i in range(len(test)):
    if target[i] != test[i]:
      return False
  return True

def sim(target, limit = 10000):
  for i in range(1, limit+1):
    if is_match(rna.randbases(len(target)), target):
      return i
  return -1

