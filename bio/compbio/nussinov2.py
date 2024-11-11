import sys
from numpy import *
from compbio import traceback, base_pair

def score_matrix(seq,N):
  L=len(seq)
  s=zeros((L,L))
  for L in range(1,N):
    for i in range(0,N-L):
      j=i+L
      if j-i>=1:
        case1=s[i+1,j-1]+base_pair(seq[i],seq[j])
        case2=s[i+1,j]
        case3=s[i,j-1]
        case4=0
        tmp=[]
        for k in range(i+1,j):
          tmp.append(s[i,k]+s[k+1,j])
          case4=max(tmp)
        s[i,j]=max(case1,case2,case3,case4)
      else:
        s[i,j]=0
  return s

def print_structure(seq):
  N=len(seq)
  s=score_matrix(seq,N)
  pair=traceback(s,seq,0,len(seq)-1,[])
  print(seq)
  for x in range(0,len(seq)):
    if True in (x==pair[y][0] for y in range(0,len(pair))):
      sys.stdout.write('(')
    elif True in (x==pair[y][1] for y in range(0,len(pair))):
      sys.stdout.write(')')
    else:
      sys.stdout.write('.')
  print('\n','\n',"Scoring Matrix:",'\n',s)

seq='AUGGCAUCGGC'
print_structure(seq)
