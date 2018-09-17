model = new Model()
rolls = 0
sums = [2,3,4,5,6,7,8,9,10,11,12]
counts = [2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,10:0,11:0,12:0]

println "Starting rolls"
while(sums.size > 0) {
  def roll = model.eval("y") as Integer
  sums .removeAll { it == roll }
  counts[roll] += 1
  rolls++
}
println "That took $rolls rolls"
println "The results $counts"