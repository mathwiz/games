from rna import *
from simulation import *

import unittest

class Test1(unittest.TestCase):
  def test_complement(self):
    self.assertEqual(complement(1), 2)
    self.assertEqual(complement(2), 1)
    self.assertEqual(complement(3), 4)
    self.assertEqual(complement(4), 3)

  def test_match(self):
    seq = [1,2,3,4]
    self.assertTrue(is_match(seq, seq))
    self.assertFalse(is_match(seq, [1,2,3,3]))

  def test_match_len(self):
    seq = [1,2,3,4]
    with self.assertRaises(IndexError):
      is_match(seq, [1,2,3])

  def test_simulate_rna(self):
    maximum = 1
    print("Testing iterations to make match when length is...")
    for i in range(1, maximum+1):
      print(i, ":", simulate_rna([4 for j in range(i)], 5**i))
    self.assertTrue(True)

  def test_simulate_machine(self):
    for i in range(10):
      m = Machine(randbases(6*10))
      m.exec()
      print("steps", m.moves)
      print("fitness", fitness(m.tape))
    self.assertTrue(True)

if __name__ == '__main__':
  unittest.main()
