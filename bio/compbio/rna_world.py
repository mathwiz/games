import sys,string
from numpy import *
from matplotlib import *

def base_pair(l,m):
 delta=0;
 if (l=='A' and m=='U') or (l=='U' and m=='A'):
  return 1;
 elif (l=='G' and m=='C') or (l=='C' and m=='G'):
  return 1;
 else:
  return 0;

def scoring_matrix(seq,N):
  L=len(seq);
  s=zeros((L,L));
  for n in range(1,N):
    for j in range(n,N):
      i=j-n
      if j-i>=4:
        case1=s[i+1,j-1]+base_pair(seq[i],seq[j]);
        case2=s[i+1,j];
        case3=s[i,j-1];
        tmp=[];
        for k in range(i+1,j):
          tmp.append(s[i,k]+s[k+1,j]);
          case4=max(tmp);
        s[i,j]=max([case1,case2,case3,case4]);
      else:
        s[i,j]=0
  return s;

def traceback(s,seq,i,j,pair):
 if i<j:
  if s[i,j]==s[i+1,j]:
   traceback(s,seq,i+1,j,pair);
  elif s[i,j]==s[i,j-1]:
   traceback(s,seq,i,j-1,pair);
  elif s[i,j]==s[i+1,j-1]+base_pair(seq[i],seq[j]):
   pair.append([i,j,str(seq[i]),str(seq[j])]);
   traceback(s,seq,i+1,j-1,pair);
  else:
   for k in range(i+1,j):
    if s[i,j]==s[i,k]+s[k+1,j]:
     traceback(s,seq,i,k,pair);
     traceback(s,seq,k+1,j,pair);
     break;
 return pair;
 
def print_structure(seq):
  N=len(seq)
  s=scoring_matrix(seq,N)
  pair=traceback(s,seq,0,len(seq)-1,[])
  print(seq)
  for x in range(0,len(seq)):
    if True in (x==pair[y][0] for y in range(0,len(pair))):
      sys.stdout.write('(')
    elif True in (x==pair[y][1] for y in range(0,len(pair))):
      sys.stdout.write(')')
    else:
      sys.stdout.write('.')
  sys.stdout.write('\n')


#seq='UGGAUAGCCA'
seq='UGGACCACUCUGGUAGAGUGCCUCCUUUGCAAGGAGGCCCUGGGAUCGAAUCCCAGGGGUCCA'
print_structure(seq)
