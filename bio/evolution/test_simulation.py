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

  def test_sim(self):
    maximum = 7
    print("Testing iterations to make match when length is...")
    for i in range(1, maximum+1):
      print(i, ":", sim([4 for j in range(i)], 10**i))


if __name__ == '__main__':
  unittest.main()
