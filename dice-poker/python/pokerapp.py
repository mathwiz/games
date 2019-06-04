from random import randrange


class PokerApp:
    
    def __init__(self, interface):
        self.dice = Dice()
        self.money = 100
        self.round_cost = 10
        self.interface = interface

        
    def run(self):
        while self.money >= 10 and self.interface.wantToPlay():
            self.playRound()
        self.interface.close()

        
    def playRound(self):
        self.money = self.money - self.round_cost
        self.interface.setMoney(self.money)
        self.doRolls()
        result, score = self.dice.score()
        self.interface.showResult(result, score)
        self.money = self.money + score
        self.interface.setMoney(self.money)


    def doRolls(self):
        self.dice.rollAll()
        roll = 1
        self.interface.setDice(self.dice.values())
        toRoll = self.interface.chooseDice()
        while roll < 3 and toRoll != []:
            self.dice.roll(toRoll)
            roll += 1
            self.interface.setDice(self.dice.values())
            if roll < 3:
                toRoll = self.interface.chooseDice()



        
class Dice:
    def __init__(self):
        self.dice = [0]*5
        self.rollAll()


    def rollAll(self):
        self.roll(range(5))


    def roll(self, which):
        for pos in which:
            self.dice[pos] = randrange(1,7)


    def values(self):
        return self.dice[:]


    def score(self):
        counts = [0]*7
        for value in self.dice:
            counts[value] = counts[value] + 1

        if 5 in counts:
            return "Five of a kind", 30
        elif 4 in counts:
            return "Four of a kink", 15
        elif (3 in counts) and (2 in counts):
            return "Full house", 12
        elif 3 in counts:
            return "Three of a kind", 8
        elif not (2 in counts) and (counts[1]==0 or counts[6]==0):
            return "Straight", 20
        elif counts.count(2) == 2:
            return "Two pair", 5
        else:
            return "Garbage", 0

        
