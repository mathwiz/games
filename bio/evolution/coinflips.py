import random

def flips(n):
  return [random.choice([0,1]) for x in range(n) ] 

P = 16
n_zeroes = 0
n_ones = 0
n_odds = 0
n_evens = 0

zeroes = [ 0 for x in range(10) ]
ones = [ 1 for x in range(10) ]
odds = [1,0,1,0,1,0,1,0,1,0]
evens = [0,1,0,1,0,1,0,1,0,1]


for x in range(2**P):
  results = flips(10)
  if results == zeroes:
    n_zeroes += 1
  if results == ones:
    n_ones += 1
  if results == odds:
    n_odds += 1
  if results == evens:
    n_evens += 1

  print("Zeroes", n_zeroes)
  print("Ones", n_ones)
  print("Odds", n_odds)
  print("Evens", n_evens)
  print("Trials", x)

