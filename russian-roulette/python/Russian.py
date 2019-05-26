import random

class Gun:
    def __init__(self, shots):
        self.shots = shots
        self.current = 0
        self.chamber = random.randint(1, shots)
        #print "Loaded chamber", self.chamber

    def loaded_chamber(self):
        return self.chamber

    def shoot(self):
        self.current += 1
        return self.current == self.chamber


def prompt():
    response = raw_input("Shoot? [Y/n] ")
    return response == 'n' or response == 'N'


def start():
    shots = int(input("How many shots? "))
    if shots < 1:
        print "Shots must be greater than zero"
        return start()
    return shots


def play():
    shots = start()
    print "Shooting", shots, "shots."
    gun = Gun(shots)
    for x in range(shots+1):
        print "Shot number", x+1
        stop = prompt()
        if stop:
            print "Chicken!", "The bullet was in", gun.loaded_chamber()
            break
        if gun.shoot():
            print "Bang! You're dead!"
            break
    else:
        print "How are you not dead?"
    

def main():
    print "Welcome to Russian Roulette"
    play()

if __name__ == '__main__':
    main()