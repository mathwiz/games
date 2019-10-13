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
    

def read_a_legal_move(board):
    response = raw_input("Your move: ")


class Board:

    def __init__(self):
        self.board = ["board", 0, 0, 0, 0, 0, 0, 0, 0, 0]


    def __str__(self):
        return \
            row_repr(self.board[1], self.board[2], self.board[3]) + '\n' + \
            "-----------" + "\n" + \
            row_repr(self.board[4], self.board[5], self.board[6]) + '\n' + \
            "-----------" + "\n" + \
            row_repr(self.board[7], self.board[8], self.board[9]) + '\n' + \
            "-----------" + "\n"
            
    def move_x(self, pos):
        self.board[pos] = 10

            
    def move_o(self, pos):
        self.board[pos] = 1
        
    
    def space_available(self, pos):
        return self.board[pos] == 0
            
        
    
    
    