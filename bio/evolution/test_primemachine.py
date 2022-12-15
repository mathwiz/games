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
    self.assertEqual(fitness(A), 75)
    self.assertEqual(fitness(B), 78)
    self.assertEqual(fitness(C), 73)

  def test_state(self):
    self.assertEqual(state(1,1), 0)
    self.assertEqual(state(2,1), 4)
    self.assertEqual(state(3,1), 8)
    self.assertEqual(state(4,1), 12)
    self.assertEqual(state(1,2), 1)
    self.assertEqual(state(2,2), 5)
    self.assertEqual(state(3,2), 9)
    self.assertEqual(state(4,2), 13)
    self.assertEqual(state(1,3), 2)
    self.assertEqual(state(2,3), 6)
    self.assertEqual(state(3,3), 10)
    self.assertEqual(state(4,3), 14)
    self.assertEqual(state(1,4), 3)
    self.assertEqual(state(2,4), 7)
    self.assertEqual(state(3,4), 11)
    self.assertEqual(state(4,4), 15)


if __name__ == '__main__':
    unittest.main()


