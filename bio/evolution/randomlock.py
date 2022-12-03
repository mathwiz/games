from random import randint

def random_base(RNA=False):
  return ('UCAG' if RNA else 'TCAG')[randint(0,3)]

def random_bases(length, RNA=False):
  return [random_base(RNA)
          for n in range(0, length)]

def random_codons(num, RNA=False):
  return random_bases(3*num, RNA)


