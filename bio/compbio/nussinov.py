import numpy as np
# Define RNA sequence
seq="AUGGCAUCGGC"
N=len(seq)

def base_pair(i,j):

    pair = [seq[i], seq[j]]

    if pair == ['A','U'] or pair == ['U','A']:
        return(1)
    elif pair == ['C','G'] or pair == ['G','C']:
        return(1)
    else:
        return(0)


def score(i, j, mat):
    A = mat[i+1, j-1] + base_pair(i,j)
    B = mat[i+1, j]
    C = mat[i, j-1]
    D = bifurcation_score(i, j, mat)
    mat[i,j] = max(A, B, C, D)

def bifurcation_score(i, j, mat):
    result = 0
    for k in range(i+1, j):
        result = max(result, mat[i,k] + mat[k+1,j])
    return result

# Initialize a scoring matrix
s = np.zeros([N, N])
np.fill_diagonal(s,0)

# Proceed through the subsequences

for L in range(1, N):
    for i in range(0, N-L):
        j = i + L
        score(i, j, s) 
    
# Print sum of scoring matrix so far
print(s)
print(np.sum(s))

import matplotlib.pyplot as plt

plt.imshow(s)
plt.colorbar()
plt.savefig("s.png")



