# Board representation
# 1 | 2 | 3
# 4 | 5 | 6
# 7 | 8 | 9
#
# X = 10, O = 1, empty = 0
#

    
def convert_to_letter(val):
    if val == 10:
        return "X"
    elif val == 1:
        return "O"
    else:
        return " "

        
def row_repr(x, y, z):
    return \
        " %s | %s | %s " % (convert_to_letter(x), convert_to_letter(y), convert_to_letter(z))
        
        
def play():
    pass
    
    
def y_or_n(prompt):
    response = raw_input(prompt + " (y/n) ")
    if len(response) == 0:
        return y_or_n("Please answer with y or n")
    elif response[0:1] == "y":
        return True
    elif response[0:1] == "n":
        return False
    else:
        return y_or_n("Please answer with y or n")
            

def read_a_legal_move(board):
    response = raw_input("Your move: ")


class Board:

    def __init__(self):
        self.board = ["board", 0, 0, 0, 0, 0, 0, 0, 0, 0]

            
    def move_x(self, pos):
        self.board[pos] = 10

            
    def move_o(self, pos):
        self.board[pos] = 1
        
    
    def space_available(self, pos):
        return self.board[pos] == 0
            
    
    def sum_triplet(self, trip):
        b = self.board
        return b[trip[0]] + b[trip[1]] + b[trip[2]]
        
        
    def compute_sums(self):
        return [self.sum_triplet(t) for t in TRIPLETS]
        
        
    def is_win(self):
        comp_win = 3 * COMPUTER
        opp_win = 3 * OPPONENT
        return any([s==comp_win or s==opp_win for s in self.compute_sums()])


    def __str__(self):
        return \
            row_repr(self.board[1], self.board[2], self.board[3]) + '\n' + \
            "-----------" + "\n" + \
            row_repr(self.board[4], self.board[5], self.board[6]) + '\n' + \
            "-----------" + "\n" + \
            row_repr(self.board[7], self.board[8], self.board[9]) + '\n'



# Constants
COMPUTER = 10
OPPONENT = 1
CORNERS = [1, 3, 7, 9]
SIDES = [2, 4, 6, 8]
TRIPLETS = [ [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

# State       
B = Board()
