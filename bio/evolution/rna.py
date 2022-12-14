from random import randint

def randbase():
  return randint(1,4)

def randbases(length):
  return [randbase() for n in range(0, length)]

def randcodons(num):
  return randbases(3*num)

def complement(b):
  if b==1:
    return 2
  elif b==2:
    return 1
  elif b==3:
    return 4;
  elif b==4:
    return 3

