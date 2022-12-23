import unittest
from primemachine import *

A = [0 for i in range(100)]
B = A.copy()
B[1] = 1
B[10] = 1
B[96] = 1
C = A.copy()
C[0] = 1
C[99] = 1

class MyTestCase(unittest.TestCase):
  def test_step(self):
    program = [2,1,2,4,1,4, 4,1,3,2,2,2, 3,1,1,3,3,3, 4,2,1,4,2,1, 2,1,4,4,4,4 ] 
    m = Machine(program)
    for i in range(500):
      if m.halted:
        break
      print("move", m.moves)
      m.step()
      print(m.tape)
      print("pos", m.tape_pos)
      print("card", m.card)

    self.assertFalse(False)

  def test_unknown_state(self):
    program = [1,1,1,1,1,1,2,3,4,1,2,3,-1] # has extra element
    self.assertFalse(unknown_state(0, 6, program))
    self.assertFalse(unknown_state(1, 6, program))
    self.assertTrue(unknown_state(2, 6, program))
    self.assertTrue(unknown_state(2, 6, program + [1,2,3,4]))
    self.assertFalse(unknown_state(2, 6, program + [1,2,3,4,5]))

  def test_off_tape(self):
    self.assertTrue(off_tape(-1, A))
    self.assertTrue(off_tape(100, A))
    self.assertFalse(off_tape(34, A))

  def test_code0(self):
    program = [2,3,4,1,2,3]
    tides = get_code(0, 0, 6, program)
    self.assertEqual(tides[0], 2)
    self.assertEqual(tides[1], 3)
    self.assertEqual(tides[2], 4)
    tides = get_code(1, 0, 6, program)
    self.assertEqual(tides[0], 1)
    self.assertEqual(tides[1], 2)
    self.assertEqual(tides[2], 3)

  def test_code1(self):
    program = [1,1,1,1,1,1, 2,3,4,1,2,3]
    tides = get_code(0, 1, 6, program)
    self.assertEqual(tides[0], 2)
    self.assertEqual(tides[1], 3)
    self.assertEqual(tides[2], 4)
    tides = get_code(1, 1, 6, program)
    self.assertEqual(tides[0], 1)
    self.assertEqual(tides[1], 2)
    self.assertEqual(tides[2], 3)

  def test_code2(self):
    program = [2,1,2,4,1,4, 4,1,3,2,2,2, 3,1,1,4,3,2, 2,2,1,4,4,4, 4,1,4,4,4,4 ] 
    tides = get_code(0, 2, 6, program)
    self.assertEqual(tides[0], 3)
    self.assertEqual(tides[1], 1)
    self.assertEqual(tides[2], 1)
    tides = get_code(1, 2, 6, program)
    self.assertEqual(tides[0], 4)
    self.assertEqual(tides[1], 3)
    self.assertEqual(tides[2], 2)

  def test_write(self):
    self.assertEqual(write(1), 0)
    self.assertEqual(write(2), 0)
    self.assertEqual(write(3), 1)
    self.assertEqual(write(4), 1)

  def test_move(self):
    self.assertEqual(move(1), -1)
    self.assertEqual(move(2), 1)
    self.assertEqual(move(3), -1)
    self.assertEqual(move(4), 1)

  def test_fitness(self):
    self.assertEqual(fitness([1,0], [0,0,0]), 1/3)
    self.assertEqual(fitness([1,0,0,1,1], [0,0,0,1]), 3/4)
    self.assertEqual(fitness([1,0,0], [0,0,0,1]), 2/4)
    self.assertEqual(fitness([1,0], []), 0.0)

  def test_prime_fitness(self):
    self.assertEqual(prime_fitness(A), .75)
    self.assertEqual(prime_fitness(B), .78)
    self.assertEqual(prime_fitness(C), .73)

  def test_state(self):
    self.assertEqual(state((1,1,1)), 0)
    self.assertEqual(state((1,2,1)), 4)
    self.assertEqual(state((1,3,1)), 8)
    self.assertEqual(state((1,4,1)), 12)
    self.assertEqual(state((1,1,2)), 1)
    self.assertEqual(state((1,2,2)), 5)
    self.assertEqual(state((1,3,2)), 9)
    self.assertEqual(state((1,4,2)), 13)
    self.assertEqual(state((1,1,3)), 2)
    self.assertEqual(state((1,2,3)), 6)
    self.assertEqual(state((1,3,3)), 10)
    self.assertEqual(state((1,4,3)), 14)
    self.assertEqual(state((1,1,4)), 3)
    self.assertEqual(state((1,2,4)), 7)
    self.assertEqual(state((1,3,4)), 11)
    self.assertEqual(state((1,4,4)), 15)
    self.assertEqual(state((2,1,1)), 32)
    self.assertEqual(state((3,2,1)), 64+4)
    self.assertEqual(state((4,3,1)), 96+8)
    self.assertEqual(state((2,4,1)), 32+12)
    self.assertEqual(state((3,1,2)), 64+1)
    self.assertEqual(state((4,2,2)), 96+5)
    self.assertEqual(state((2,3,2)), 32+9)
    self.assertEqual(state((3,4,2)), 64+13)
    self.assertEqual(state((4,1,3)), 96+2)
    self.assertEqual(state((2,2,3)), 32+6)
    self.assertEqual(state((3,3,3)), 64+10)
    self.assertEqual(state((4,4,3)), 96+14)
    self.assertEqual(state((2,1,4)), 32+3)
    self.assertEqual(state((3,2,4)), 64+7)
    self.assertEqual(state((4,3,4)), 96+11)
    self.assertEqual(state((2,4,4)), 32+15)


if __name__ == '__main__':
    unittest.main()


