import unittest
import randomlock as rl


class MyTestCase(unittest.TestCase):
  def test(self):
    print("10 rna")
    print(rl.random_bases(10, RNA=True))

  def test2(self):
    print("6 dna")
    print(rl.random_codons(2, RNA=False))


if __name__ == '__main__':
    unittest.main()


