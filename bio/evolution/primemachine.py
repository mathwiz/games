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

def unknown_state(card, width, program):
  return card > (len(program) // width) - 1

def off_tape(pos, tape):
  return pos == -1 or pos == len(tape)

def get_code(sym, card, width, program):
  code_start = card * width
  code_end = code_start + width
  code = program[code_start:code_end]
  index = sym * (width//2)
  return (code[index], code[index+1], code[index+2])
      
class Machine:
  def __init__(self, sequence):
    self.program = sequence
    self.tape_length = 100
    self.tape_pos = 0
    self.tape = [0 for i in range(self.tape_length)]
    self.card_width = 6
    self.card = 0
    self.moves = 0
    self.halted = False

  def step(self):
    if self.halted:
      return False
    current_sym = self.tape[self.tape_pos]
    code = get_code(current_sym, self.card, self.card_width, self.program) 
    self.tape[self.tape_pos] = write(code[0])
    self.tape_pos = move(code[0])
    self.card = state(code[1], code[2])
    if off_tape(self.tape_pos, self.tape):
      self.halted = True
    if unknown_state(self.card, self.card_width, self.program):
      self.halted = True
    return True

  def exec(self):
    move_max = 1000
    moves = 0
    code = self.program[counter]
    for i in range(Machine.MoveMax):
      moves = i + 1

      counter += 1
    return moves

  def __str__(self):
    return ''.join([str(x) for x in self.program])
