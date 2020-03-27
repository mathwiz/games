import random


# Board representation
# 1 | 2 | 3
# 4 | 5 | 6
# 7 | 8 | 9
#
# X = 10, O = 1, empty = 0
#

    
def convert_to_letter(val):
    if val == OPPONENT:
        return "X"
    elif val == COMPUTER:
        return "O"
    else:
        return " "

        
def row_repr(x, y, z):
    return \
        " %s | %s | %s " % (convert_to_letter(x), convert_to_letter(y), convert_to_letter(z))
        
        
def play(board):
    first = choose_side()
    if first:
        player_move(board)
    else:
        computer_move(board)
    
    
def show_position(board):
    print("")
    print(board)


def make_move(player, pos, board):
    if player == COMPUTER:
        board.move_o(pos)
    else:
        board.move_x(pos)


def is_game_over(board):
    if board.is_win():
        print('{} wins!'.format(board.winner()))
        return True
    elif board.filled():
        print('Tie game!')
        return True
    return False


def player_move(board):
    move = read_a_legal_move(board)
    make_move(OPPONENT, move, board)
    show_position(board)
    if not is_game_over(board):
        return computer_move(board)
    
    
def computer_move(board):
    move = choose_best_move(board)
    print("Move is {}".format(move))
    make_move(COMPUTER, move, board)
    show_position(board)
    if not is_game_over(board):
        return player_move(board)
    

def choose_best_move(board):
    return \
        random_empty_space(board)
        
        
def random_empty_space(board):
    indexes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    random.shuffle(indexes)
    for i in indexes:
        if board.space_available(i):
            return i
    return None
    
    
def choose_side():
    return y_or_n("Do you want to go first?")
    
    
def y_or_n(prompt):
    response = input(prompt + " (y/n) ")
    if len(response) == 0:
        return y_or_n("Please answer with y or n")
    elif response[0:1] == "y":
        return True
    elif response[0:1] == "n":
        return False
    else:
        return y_or_n("Please answer with y or n")
            

def read_a_legal_move(board):
    response = int(input("Your move: "))
    if response < 1 or response > 9:
        print("Please enter a number between 1 and 9")
        return read_a_legal_move(board)
    elif not board.space_available(response):
        print('{d} is occupied. Please choose again.'.format(response))
        return read_a_legal_move(board)
    else:
        return response 


class Board:

    def __init__(self):
        self.board = ["board", 0, 0, 0, 0, 0, 0, 0, 0, 0]


    def move_x(self, pos):
        self.board[pos] = OPPONENT

            
    def move_o(self, pos):
        self.board[pos] = COMPUTER
        
    
    def space_available(self, pos):
        return self.board[pos] == 0
            
    
    def sum_triplet(self, trip):
        b = self.board
        return b[trip[0]] + b[trip[1]] + b[trip[2]]
        
        
    def compute_sums(self):
        return [self.sum_triplet(t) for t in TRIPLETS]
        
    
    def game_over(self):
        return self.is_win() or self.filled()


    def filled(self):
        return not (0 in self.board[1:])
        
        
    def is_x_win(self):
        win = 3 * OPPONENT
        return any([s==win for s in self.compute_sums()])
        
        
    def is_o_win(self):
        win = 3 * COMPUTER
        return any([s==win for s in self.compute_sums()])
        
        
    def is_win(self):
        return self.is_x_win() or self.is_o_win()
        
        
    def winner(self):
        if self.is_x_win():
            return "X"
        elif self.is_o_win():
            return "O"
        else:
            return None
            

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


# Run 
play(B)
