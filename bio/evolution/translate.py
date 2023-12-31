def translate(DNA):
    # A python dictionary data structure to translate.
    dna_to_pro = {'ATG': 'M', 'GCG': 'A', 'TCA': 'S', 'GAA': 'E', 'GGG': 'G', 'GGT': 'G', 'AAA': 'K', 'GAG': 'E', 'AAT': 'N', 'CTA': 'L', 
                  'CAT': 'H', 'TCG': 'S', 'TAG': 'STOP', 'GTG': 'V', 'TAT': 'Y', 'CCT': 'P', 'ACT': 'T', 'TCC': 's', 'CAG': 'Q', 'CCA': 'P', 
                  'TAA': 'STOP', 'AGA': 'R', 'ACG': 'T', 'CAA': 'Q', 'TGT': 'C', 'GCT': 'A', 'TTC': 'F', 'AGT': 'S', 'ATA': 'I', 'TTA': 'L', 
                  'CCG': 'P', 'ATC': 'I', 'TTT': 'F', 'CGT': 'R', 'TGA': 'STOP', 'GTA': 'V', 'TCT': 'S', 'CAC': 'H', 'GTT': 'V', 'GAT': 'D', 
                  'CGA': 'R', 'GGA': 'G', 'GTC': 'V', 'GGC': 'G', 'TGC': 'C', 'CTG': 'L', 'CTC': 'L', 'CGC': 'R', 'CGG': 'R', 'AAC': 'N', 
                  'GCC': 'A', 'ATT': 'I', 'AGG': 'R', 'GAC': 'D', 'ACC': 'T', 'AGC': 'S', 'TAC': 'Y', 'ACA': 'T', 'AAG': 'K', 'GCA': 'A', 
                  'TTG': 'L', 'CCC': 'P', 'CTT': 'L', 'TGG': 'W'}
    protein = []
    start = 0
    # Step through the DNA sequence and translate.
    while start + 2 < len(DNA):
        codon = DNA[start:start + 3]
        protein.append(dna_to_pro[codon])
        start += 3
    return ''.join(protein)

