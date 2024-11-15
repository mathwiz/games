from Bio.Seq import Seq
from Bio import motifs
from Bio import Alphabet
import numpy as np
import matplotlib.pyplot as plt
gap_rna=Alphabet.Gapped(Alphabet.IUPAC.unambiguous_rna, '-')

introns=[]
information=[]

intronlibrary=['UUGAGCCGUAUGCCGGGAAA--CUGGCACGUACGGUUCUUGUGAGUGUGGGGC---GGUGAUGCAGUAAUGCAUCACUAAACCC-CG-UCGU', 'GGGAGCCGGAUGAGAAGAAA-C-UCUCAUGUCCGGUUCUGU---AGU-AGAGA------UGGAAUAGGGAAAUAACCAUCAACU-AU--AAC', 'AGGAGCCGAAUGAAACCAAA--GUUUCAUGUUCGGUUUUGA---AUU-AGAGA---CGUUAAAAAUAAUGAAUCGACGUCGACU-AU--AAC', 'UUGAGCCGGAUGAUGAAAAA--UUAUCAUGUCCGGUUCUUU---CGG-GGGAU---GAAUUGAAUCUAUAAGAAUUCACCUAUC-CU--AAU', 'GAGAGCUUUUUGCGGGGAAA--CUUGCAAGUAAAGUUUGG-----GG-GGAGG-------------------CGGGCGUCGACC-CA-ACCU', 'AACCGCCGUGUACG--GAAC----CGUACGCACGGUGGUG-----UG-AGAGG----ACGGCGGGUGUGAAUCCGCCUCCUACU-CG---AU', 'GAACGCCGUAUGCUG-GAAA--CUCGCCUGUACGGUGUGA----AGU-GGGGGAGCUGGAGAUAACUUCAAAAGCUUACCUAUC-AC--UAU', 'GAGAGCUUUUUGCGGGGAAA--CUUGCAAGUACAGUUUGG-----GG-GGAGA-------------------CGGGCGUCGACC-CA-ACCU', 'AGGAGCCGUGUGAGAUGAAA--GUCUCAUGCACGGUUUUGAA--GAG-AGAAA------GAAGUGAGGAAUCCUCUUUUCGUCU-CU--GAC', 'ACGAGCCACAUGCAGGGAAA--CUUGCACGUGUGGUUCUG-----GCCGGGGA-------------------CCCCGGUAUACU-GU---AC', 'AGGAGCCGUAUGAGGUGAAA--GUCUCAAGUACGGUUUUG----AAG-ACCAG-----CAGGAUUGGUGACAGUCUUGCUGUGU-UU--AAU', 'GAGAGCUUUUUGCGGGGAAA--CUUGCAAGUCAAGUUUGG-----GG-GGAGG-------------------CGGGCGUCGACC-CA-ACCU', 'GAGAGCUUUUUGCGGGGAAA--CUUGCAAGUACAGUUUGG-----GG-GGAGG-------------------CGGGCGUCGACC-CU---AC', 'AGGAGCCGAAUGAAAUCAAA--AUUUCAUGUUCGGUUUUGA---AUU-AGAGA---CGUUAAAAAUAAUCAACCAACGUCGACU-AU--AAC', 'GAAAGCCGUAUUCGAUGAAA--GUCGUAUGUACGGCUUGG-----AG-GGAGA------UCUUUCAUAUCUUUCGAGAUCCGCC-CU---AC', 'GAGAGCUUUUUGCGGGGAAA--CUUGCAAGUACAGUUUGG-----AG-GGAGG-------------------CGGGCGUCGACC-CA---AC', 'UUGAGCCGGAUGAAAGGAAA--CUUUCACGUCCGAUUUUGA---AGG-GGGGG-----------AGAUCCUAUAGAAUCCUAUC-CC--AAU', 'UUGAGCCGUAUGCGGGGAAA--CUUGCACGUGCGGUUCUUU--GAGG-GGGGG----GAGCUUGCUCGAAAGAGCCUACCUAUC-CC--GAU', 'UUGAGCUGUACGAGAUGAAA--GUCUCAUAUACAGUUCUU----AGG-GGGGU--------------UUAAUAGUUUACCUAUC-UC--AAU', 'UUGAGCCGUAUGCGAGGAAA--CUUGCACGUGCGGUUCUUUGCUGAG-GGGGG-------AAAGCUUGAAAGAGCCUAUCCAUC-CU--GAU', 'UUGAGCCGUAUGCGAUGAAA--GUUGCACGUACGGUUCUU----ACC-GGGGG-------AAAGCUUGAGAGAGCCUACCUAUC-GG--AAC', 'AGGAGCCGUAUGAAUGGAGA--CAUUCACGUACGGUUUUGG---AGU-AGCAG------GAUAUAUGGUAACAUGUACUUGGCU-AU--AAG', 'GUGAGCCGUGUGCGAUGAAA--GUCGCAAGCACGGUUCUG----AUG-GGGGG-------AAAACGAGAGAUCGUCUACCUAUC-CA--ACU', 'GAGAGCCGUAUGAUGGGAAA--CUAUCACGUACGGUUCGG-----GA-AAAGG-AUAUACUGAUAAGAGGUAUACGUAUCUAGU-UC---AU', 'UUGAGCUGUACGAGAUGAAA--GUCUCAUAUACGGUUCUC----AGA-GGGGG------------------AGUUCCGCCUAUC-UC--AAU', 'UUGAGCCGUAUGCGAGGAAA--CUUGCACGUGCGGUUCUUU--GAGG-GGGGG--------AAGCUUGAAAGAGCCUACCCAUC-CC--GAU', 'UUGAGCCGUAUGCGAAGAAA--CUUGCACGUGCGGUUCUUUGCUGAG-GGGGG-------AAAGCUUGAAAGAGCCUAUCCAUC-CU--GAU', 'UUGAGCCGUAUGUGCUGAAA--GGUACAAGUACGGUUCUU-----AG-GGGAG---AAAGAGUUGGUAACACCUCUGACUUACC-CG--ACU', 'GCGAGCCGUAUGAUGGGAAA--CUAUCACGUACGGUUCUG-----AG-GGCAA--------GGUAUAUUCUAAAUGCCUUGACCCCU---AC', 'AGGAGCCGUAUGAGGUGAAA--AUCUCAUGUACGGUUCUG----UAG-AGUGG-----CAGUAAGGGUGACUUAUCUGUCACCU-UU--UCC', 'UUGAGCCGUAUGCGAGGAAA--CUUGCACGUGCGGUUCUUU--GAGG-GGGGA--------AAGCUUGAAAGAGCCUAUCCAUC-CC--GAU', 'AGGAGCCGUAUGAGGUGAAA-A-UCUCAUGUACGGUUCUG----UAG-AGGGA-----CAGUAAGGAUGACUUAUCUGUCGACU-UU--UCC', 'UUGAGCCGUAUGCGAGGAAA--CUUGCACGUGCGGUUCUUU--GAGG-GGGAA--------AAGCUUGAAAGAGCCUAUCCCUC-CC--GAU', 'UUGAGCCGUAUGCCAUGAAA--GUGGCACGUACGGUUCUG----AGG-GGGGG-------AAAGUCUGAGAGGACCUACCUAUC-CC----A', 'AGGAGCCGUAUGAGGUGAAA--AUCUCACGUACGGUUCUGG---AAC-GGAGA---------UUCUUUCAAUUGAAUGACGACC-GU--AAC', 'GGGAGCCGUGUGCAGCGAAA--GUUGCACGCACGGAUCUAA---CAG-AGAGG----GACGGGGAAUAAUAUCCCCUCUCGGCU-CU--AAC', 'GGGAGCCGGAUGAGGGGAAA-UUUCUCACGUCCGGAUCUU-----UG-AGAGC-------------------CUCCGGGCUACU-CU---CU', 'UUGAGCCGUAUGCGAUGAAA--GUUGCACGUACGGUUCUU----AAG-AGGGG-------AAAAUGAGUGAUCAUCUACCUAUU-CU--AAC', 'UUGAGCCGUGUGCGUUGAAA--GAUGCAUGCACGGUUCUU----AGG-GGGGG---------AAAGCCGGUAACCGUACCUAUC-CC--AAU', 'UUGAGCCGUGUGCGGUGAAA--GUCGCAUGCACGGUUCUA----CUG-GGGGG-------AAAGCCUGAGAGGGCCUACCUAUC-CA--ACU', 'AGGAGCUGGAUGAGAAGAAA--CUCUCACGUCCGGUUCUGU---AGU-AGAGA------UGGAAUUCAGAAACAACCAUCAGCU-AU--AAC', 'CUGAGCCGUAUGAGG-GAAA--UUCUCAAGUACGGUUCUA----AGG-GAAGG---------------AAUUGAACUACCUAUU-CC--GGC', 'UUGAGCCGGAUGAGGGGCGA--CUCUCAUGUCCGGUUCUU-----AG-GGGAC---GGCGGCGCAGUAAUGCGCUGCUGUUACC-CG---AC', 'UUGAGCCGUAUGCGAUGAAA--GUCGCACGUACGGUUCUU----AGA-GGGGG-------AAAGUUCGAGAGGACCUACCUAUC-UC--AAC', 'UUGAGCCGUAUGCGG-GAAA-ACUCGCACGUACGGUUCUU----AGG-GGGGG------GAAAGCUUGAGAGGGCCUACCUAUC-CC--GAC', 'UUGAGCCGUACGAGAUGAAA-U-UUUCAUAUACGGUUCUC----GGA-GGGGG-----------AGUCGGGCUAGUUACCUAUC-UC--AAU', 'UUCAGCCGUGUGCGGUGAAA--GUCGCACGCACGGUUGUG----AGG-GGGGG-------AAAAUCUGUGAAGAUCUACCUAUC-CC--GAU', 'GAAAGCCGUAUUCGAUGAAA--GUCGUAUGUACGGCUUGG-----AG-GGAGA------UCUUUCCUAUCUUUCGAGAUCCACC-CU---AC', 'AGGAGCCGUAUGAGAUGAAA--AUCUCACGUACGGUUCUGU---AAU-AGCGA-----UGGGCACAGUGAUGUUAUCAUCGACU-AU--GAU', 'GAGAGCCGUAUAAUUAGAAA--GUAUCCCGUACGGUUCGG-----UG-ACGAGUGUCAACCCUGCAAAGGGAAUGCGUCUUAGUUCA---AU', 'GAGAGCCGUAUGCGGUGAAA--GUUGCACGUACGGUUCGG-----UG-GGAGGCUUAUAUCCCUCGUGGAGUAGGCUAUCGCCC-CA---AC', 'AGGAGCUGGAUGAGAAGAAA-C-UCUCAUGUCCAGUUUUGU---AGU-AGAGA------UGGAACUAAGAAGGAACCAUCGACU-AU--AAC', 'GGGAGCGGUAUGAGCCGAGA--GGUUCACGUACCGUUCUG-----CG-AGAGG----CUGCGGGGGAGGUUCCUGCGGCCUGCU-CA---CC', 'AGAAGCCGUAUGAAAUGAAA--AUAUCAAGUACGGUUUUG----UAA-AGUGA-----CAAUUUAGGUAACUUAUUUGUCAUCU-UU--UCC', 'GGGAGCGGUGUGAAUCGAGA--GGUUCACGCACCGUUCUG-----CG-AGAGG---CCGGCUGGUGAAACUCCUCCGGCCUUCU-CA---CC', 'AGGAGCCGUAUGAAUGGAGA--CAUUCACGUACGGUUUUGG---AGU-AGCAG------GAUAUAUGGUAACAUGUACUUGUCU-AU--AAG', 'AACCGCCGUAUGCGG----A--GCCGCAUGUACGGUGGUG-----UG-AGAGG----ACGGCGGGAGUGAUCCCGCCUCCUUCU-CG---AU']

def log2(x):
  if x==0:
    l=0
  else:
    l = np.log2(x)
  return l

# Read in intron library as Biopython Sequence
for i in range(len(intronlibrary)):
    introns.append(Seq(intronlibrary[i], gap_rna))
m = motifs.create(introns, gap_rna)
print('Position 0 base counts: ',m.counts[:,0])
print('Number of "C" bases in each position: ',m.counts['C',:])


# Calculate the information content of each base
for i in range(len(m)):
    #For each position calculate the frequencies of each base (ignoring gaps), and the information contribution of each base.
    tot = m.counts['C',i]+m.counts['G',i]+m.counts['A',i]+m.counts['U',i]
    if tot==0:
        information.append(0)
        continue
    freq_c = m.counts['C',i]/tot
    freq_g = m.counts['G',i]/tot
    freq_a = m.counts['A',i]/tot
    freq_u = m.counts['U',i]/tot
 
    # From the frequencies, calculate the information by comparing to
    # the entropy of a random distribution
    totali = -log2(0.25) +\
      freq_c*log2(freq_c) +\
      freq_g*log2(freq_g) +\
      freq_a*log2(freq_a) +\
      freq_u*log2(freq_u) 
    information.append(totali)


plt.plot(information)
plt.savefig("info.png")
