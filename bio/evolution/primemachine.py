def move(code):
  nyb = code - 1
  return -1 if (nyb == 0 or nyb == 1) else 1

def write(code):
  nyb = code - 1 
  return 0 if (nyb == 0 or nyb == 2) else 1

def state(a, b):
  na = a - 1
  nb = b - 1
  return 

primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,
          53,59,61,67,71,73,79,83,89,97]
def fitness(tape):
  num = 1
  correct = 0
  for i in tape:
    if num in primes:
      correct += 1 if i==1 else 0
    else:
      correct += 1 if i==0 else 0
    num += 1
  return correct
      
class Machine:
  CardWidth = 6
  MoveMax = 1000

  def __init__(self, sequence):
    self.program = sequence
    self.tape_length = 100

  def step(self):
    tape = [0 for i in range(self.tape_length)]
    pos = 0
    counter = 0
    moves = 0
    code = self.program[counter]
    for i in range(Machine.MoveMax):
      moves = i + 1

      counter += 1
    return (tape, moves)

  def exec(self):
    tape = [0 for i in range(Machine.TapeLength)]
    pos = 0
    counter = 0
    moves = 0
    code = self.program[counter]
    for i in range(Machine.MoveMax):
      moves = i + 1

      counter += 1
    return (tape, moves)

  def __str__(self):
    return ''.join([str(x) for x in self.program])
