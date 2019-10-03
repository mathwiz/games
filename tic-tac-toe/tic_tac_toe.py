# Board representation
# 1 | 2 | 3
# 4 | 5 | 6
# 7 | 8 | 9
#
# X = 10, O = 1, empty = 0
#

def make_board():
    return ["board", 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
def convert_to_letter(val):
    if 