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
  def test_fitness(self):
    self.assertEqual(fitness(A), 75)
    self.assertEqual(fitness(B), 78)
    self.assertEqual(fitness(C), 73)

if __name__ == '__main__':
    unittest.main()


