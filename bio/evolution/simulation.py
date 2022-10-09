from rna import *
import unittest

class Test1(unittest.TestCase):
  def test_comp(self):
    self.assertEqual(complement(1), 2)
    self.assertEqual(complement(2), 1)
    self.assertEqual(complement(3), 4)
    self.assertEqual(complement(4), 3)


if __name__ == '__main__':
  unittest.main()
