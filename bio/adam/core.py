import numpy as np


def unique_elements(xs):
  unique = {}
  for x in xs:
    if x in unique:
      unique[x] = unique[x] + 1
    else:
      unique[x] = 1
  return [key for key in unique if unique[key] == 1]



