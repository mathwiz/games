import csv

infile = "a.out"
datafile = "eve.dat"

with open(infile, newline='') as csvfile:
  reader = csv.reader(csvfile)
  for row in reader:
    print(row)

print("Imported", infile, "to", datafile)
