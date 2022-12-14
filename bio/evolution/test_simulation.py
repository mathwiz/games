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
    self.assertFalse(is_match(seq, ['T','C','A']))
    self.assertFalse(is_match(seq, ['T','C','A','C']))


if __name__ == '__main__':
  unittest.main()
