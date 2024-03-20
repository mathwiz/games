import eve

sim = eve.Simulation(128, 10)

print(sim.pop)
sim.pop = 256
print(sim.pop)

sim.run()

print(eve.procreate(1, 2))
