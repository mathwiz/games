import csv


indexes = { 'females':1, 'males':2, 'mitochondria':3, 'y':4 }

def process_row(row):
  pass

def extract_rep(rows):
  pass

def process_rep(rows):
  final_pop = 0
  last_gen = 1
  return final_pop, last_gen


infile = "a.out"
datafile = "eve.dat"
replicates = 0


data = {}

with open(infile, newline='') as csvfile:
  reader = csv.reader(csvfile)
  for row in reader:
    if len(row) == 1:
      replicates += 1
      print("Replicate", replicates)
    else:
      print(row)


print("remaing replicate", replicate_rows)

print("Imported", infile, "to", datafile)
