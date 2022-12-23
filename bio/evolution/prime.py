def move(code):
  nyb = code[0] - 1
  return -1 if (nyb == 0 or nyb == 2) else 1

def write(code):
  nyb = code[0] - 1 
  return 0 if (nyb == 0 or nyb == 1) else 1

def state(letters):
  return ((letters[1]-1)*4) + (letters[2]-1)

def prime_tape():
  primes = [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
  return [1 if (x+1) in primes else 0 for x in range(100)]

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
    self.move_max = 1000
    self.tape_length = 100
    self.tape_pos = 0
    self.tape = [0 for i in range(self.tape_length)]
    self.card_width = 6
    self.card = 0
    self.moves = 0
    self.halted = False

  def maxed_out(self):
    return self.moves == self.move_max

  def step(self):
    if self.halted:
      return False
    self.moves += 1
    current_sym = self.tape[self.tape_pos]
    code = get_code(current_sym, self.card, self.card_width, self.program) 
    self.tape[self.tape_pos] = write(code)
    self.tape_pos += move(code)
    self.card = state(code)
    if off_tape(self.tape_pos, self.tape):
      self.halted = True
    if unknown_state(self.card, self.card_width, self.program):
      self.halted = True
    return True

  def exec(self):
    for i in range(self.move_max):
      stepped = self.step()
      if not stepped:
        break

  def __str__(self):
    return ''.join([str(x) for x in self.program])
