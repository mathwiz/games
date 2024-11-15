import numpy as np
import matplotlib.pyplot as plt
import random
from matplotlib import animation
finish = 0

records=[]
# Repeat random walk 50 times
for i in range(1,50):
    # Begin random walk at origin
    x = 0
    y = 0
    for j in range(1,1000):
        # Insert code for a random walk in x and y here.
        x += random.randint(-1, 1)
        y += random.randint(-1, 1)
        if (x ** 2 + y ** 2) > 100:
            # If the walk has translated 10 steps from the origin, record time.
            records.append(j)
            break
            
plt.hist(records)
plt.savefig("hist.png")
