import numpy as np

init_pop_size = 100
mean_age_first_child_A = 22
mean_age_first_child_B = 27
sd_age_first_child = 2
prob_death = 10.4 / 1000

def initialize_population(size, mean_age, sd_age):
  return [ round(np.random.normal(mean_age, sd_age)) for it in range(size) ]


popA = initialize_population(init_pop_size, mean_age_first_child_A, sd_age_first_child)
popB = initialize_population(init_pop_size, mean_age_first_child_B, sd_age_first_child)

print(np.mean(popA))
print(np.mean(popB))
print(np.std(popA))
print(np.std(popB))
