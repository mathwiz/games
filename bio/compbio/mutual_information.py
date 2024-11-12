from math import log
import numpy as np
import matplotlib.pyplot as plt

#Define sequence library by columns
library =['GCGGGGGGGGGAAGTGGG', 'GACCTGCGGCGGGCGCCC', 'GTGGGGCGTGGGGTGCGA', 'CTCGGTGGCGCGGGGCTT', 'CACAACGCCGCGGAGTCC', 'CGCACGGCGTTCCTCTCC', 'AAGGGAGTGGGAGAGTAA', 'TTTTTTTTTTTTTTTTTT', 'AGCCCCCCCCCCTTCCCC', 'CATCTAGGCCATCGTGTT', 'ACCGGGGCGACATGTAAG', 'GTTTCCCTTTTCCGCTTC', 'TTCCCTCACCCTCTCATT', 'GCGTGCCGCAAGGAGAGG', 'GTGTTGTGGCGCCTTAGG', 'GAGCTGCCGCGCCCCGAA', 'TACCCCGTACCCCACGCT', 'CTGGACGCCGCCCGCGGG', 'CGCCCCCCCCCTTCACCC', 'AAGTGAAAGTAGGAGTAA']
L = len(library[0])
pList = list()

# Calculate marginal probabilities P(X)
for col in library:
  # Find list of bases and calculate frequencies for each base
  bases = list(set(col))
  pX = [col.count(k)*1.0/L for k in bases]
  # Put list of bases and frequencies in pList
  pList.append(dict(zip(bases,pX)))

 
# Preallocate NxN info matrix 
N=len(library)
info = [[0 for i in range(N)] for i in range(N)]
for i in range(N):
 for j in range(i):
  pairs = [library[i][k] + library[j][k] for k in range(L)]
  unique_pairs = sorted(list(set(pairs)))
  for p in unique_pairs:
    # Calculate joint probability, and allocate variables for calculated frequencies in pList
    jpXY = pairs.count(p)*1.0/L 
    pX = pList[i][p[0]]
    pY = pList[j][p[1]]
    # Calculate information for given pair, and add to info matrix summation for these columns
    info[i][j] += jpXY*log(jpXY/(pX*pY))

# Visualize info matrix.   
plt.pcolormesh(np.array(info))
plt.colorbar()
plt.savefig('info.png')
