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
    seq = ['T','C','A','G']
    self.assertTrue(is_match(seq, seq))
    self.assertFalse(is_match(seq, ['T','C','A','C']))

  def test_match_len(self):
    seq = ['T','C','A','G']
    with self.assertRaises(IndexError):
      is_match(seq, ['T','C','A'])

  def test_sim(self):
    lim = 10
    print("Testing iterations to make match when length is...")
    for i in range(1, 11):
      print(i, ":", sim(['A' for j in range(i)], lim**i))


if __name__ == '__main__':
  unittest.main()
