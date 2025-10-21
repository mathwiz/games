import numpy as np

init_pop_size = 30
mean_age_first_child_A = 22
mean_age_first_child_B = 27
sd_age_first_child = 3
age_span = 20 * sd_age_first_child


class Person:
  def __init__(self, age):
    self.age = age

  def __str__(self):
    return f"I'm {self.age} years old!"
  

def initialize_population(size, mean_age, sd_age):
  return [ round(np.random.normal(mean_age, sd_age)) for it in range(size) ]

def ages_of_reproduction(first_age, increment, number):
  start = first_age - increment
  stop = start + number * increment
  return [ it for it in range(start, stop, increment) ]

print(ages_of_reproduction(mean_age_first_child_A, sd_age_first_child, 3))
print(ages_of_reproduction(mean_age_first_child_B, sd_age_first_child, 4))


popA = initialize_population(init_pop_size, mean_age_first_child_A, sd_age_first_child)
popB = initialize_population(init_pop_size, mean_age_first_child_B, sd_age_first_child)

print(popA)
print(popB)
print(np.mean(popA))
print(np.mean(popB))
print(np.median(popA))
print(np.median(popB))
print(np.std(popA))
print(np.std(popB))
