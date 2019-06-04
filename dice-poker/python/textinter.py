class TextInterface:
    def __init__(self):
        print "Welcome to video poker!"

        
    def close(self):
        print "\nThanks for playing!"

        
    def setMoney(self, amt):
        print "You currently have $%d." % (amt)

        
    def setDice(self, values):
        print "Dice: ", values

        
    def wantToPlay(self):
        ans = raw_input("Do you wish to try your luck? ")
        return ans[0] in "yY"


    def showResult(self, msg, score):
        print "%s. You win $%d." % (msg, score)


    def chooseDice(self):
        return input("Enter list of which to change ([] to stop): ")
    
    

    
