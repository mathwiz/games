import unittest
import tic-tac-toe


class BoardCase(unittest.TestCase):
    def test1(self):
        self.assertEqual(len(make_board()), 10)


if __name__ == '__main__':
    unittest.main()