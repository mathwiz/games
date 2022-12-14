class Machine:
  CardWidth = 12
  TapeLength = 100

  def __init__(self, sequence):
    self.program = sequence

  def exec(self):
    tape = [0 for i in range(Machine.TapeLength)]
    return tape

  def __str__(self):
    return ''.join([str(x) for x in self.program])
