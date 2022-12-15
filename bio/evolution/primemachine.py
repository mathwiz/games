def move(code):
  nyb = code - 1
  return -1 if (nyb == 0 or nyb == 2) else 1

def write(code):
  nyb = code - 1 
  return 0 if (nyb == 0 or nyb == 1) else 1

def state(a, b):
  return ((a-1)*4) + (b-1)

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
  def __init__(self, sequence):
    self.program = sequence
    self.tape_length = 100
    self.tape_pos = 0
    self.tape = [0 for i in range(self.tape_length)]
    self.card_width = 6
    self.card = 0
    self.moves = 0

  def step(self):
    current_sym = self.tape[self.tape_pos]
    code_start = self.card * self.card_width
    code_end = code_start + self.card_width
    code = self.program[code_start:code_end]
    index = current_sym * (self.card_width/2)
    self.tape[self.tape_pos] = write(code[index])
    self.tape_pos = move(code[0])

  def exec(self):
    move_max = 1000
    code = self.program[counter]
    for i in range(Machine.MoveMax):
      moves = i + 1

      counter += 1
    return (tape, moves)

  def __str__(self):
    return ''.join([str(x) for x in self.program])
