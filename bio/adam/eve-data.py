import csv

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

with open(infile, newline='') as csvfile:
  reader = csv.reader(csvfile)
  for row in reader:
    print(row)

print("Imported", infile, "to", datafile)
