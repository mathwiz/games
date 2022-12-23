from rna import *
from simulation import *
from prime import *

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
    for i in range(1):
      m = Machine(randbases(6*10))
      m.exec()
      print("steps", m.moves)
      print("fitness", prime_fitness(m.tape))
    self.assertTrue(True)

  def test_crossover_point(self):
    for i in range(1):
      print(".01", crossover_point(100, .01))
      print(".05", crossover_point(100, .05))

  def test_crossover1(self):
    a = [1,2,3,4,5,6]
    b = list('abcde')
    c, d = crossover(a, b, 0)
    self.assertEqual(c, b)
    self.assertEqual(d, a)
    c, d = crossover(a, b, 100)
    self.assertEqual(c, a)
    self.assertEqual(d, b)
    c, d = crossover(a, [], 0)
    self.assertEqual(c, [])
    self.assertEqual(d, a)
    c, d = crossover([], b, 0)
    self.assertEqual(c, b)
    self.assertEqual(d, [])

  def test_crossover2(self):
    a = [1,2,3,4,5,6]
    b = list('abcde')
    for n in range(6):
      c, d = crossover(a, b, n)
      self.assertEqual(c, a[:n] + b[n:])
      self.assertEqual(d, b[:n] + a[n:])

  def test_population(self):
    p = Population(128, 36)
    p.find_fits(prime_tape())
    print(p)
    for key in p.fits:
      print(key, p.fits[key])

if __name__ == '__main__':
  unittest.main()
