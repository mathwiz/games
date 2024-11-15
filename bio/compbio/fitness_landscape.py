import numpy as np
#from matplotlib import mlab
import matplotlib.pyplot as plt
# Number of steps
N = 1000

# Starting point in 2D space
r = np.zeros(2)
r=np.array([4,-6.9])

# Sampling interval
s = 1
samples = []

def bivariate_normal(X, Y, sigmax=1.0, sigmay=1.0,
                 mux=0.0, muy=0.0, sigmaxy=0.0):
    """
    Bivariate Gaussian distribution for equal shape *X*, *Y*.
    See `bivariate normal
    <http://mathworld.wolfram.com/BivariateNormalDistribution.html>`_
    at mathworld.
    """
    Xmu = X-mux
    Ymu = Y-muy

    rho = sigmaxy/(sigmax*sigmay)
    z = Xmu**2/sigmax**2 + Ymu**2/sigmay**2 - 2*rho*Xmu*Ymu/(sigmax*sigmay)
    denom = 2*np.pi*sigmax*sigmay*np.sqrt(1-rho**2)
    return np.exp(-z/(2*(1-rho**2))) / denom

# Energy surface
def q(x, y):
    gaussian1 = bivariate_normal(x, y, 1.5, 1.5, -1.5, -0.5, 0)
    gaussian2 = bivariate_normal(x, y, 1.5, 0.8, 1, 2, 0)
    gaussian3 = bivariate_normal(x, y, 1.0, 1.5, -4, -2.5, 0)
    gaussian4 = bivariate_normal(x, y, 3, 3, 0, -0.5, 0)
    return (-300*gaussian1-200.4*gaussian2-900*gaussian3+700*gaussian4)/(300+200.4+900)

p = q(r[0], r[1])

for i in range(N):
    # New position is a random perturbation from the old position
    rn = r + np.random.normal(size=2)

    # Energy value of new position
    pn = q(rn[0], rn[1])

    if pn <= p: # if the new energy is greater than the old one, we move to the new position
        p = pn
        r = rn
    else: # if not, pick a uniform random number between 0 and 1
        u = np.random.rand()
        if u < pn/p: # if the random number is less than the ratio of the new position to the old position, we move, if not, we stay try again.
            p = pn
            r = rn
    if i % s == 0: # every 10 steps sample the distribution
        samples.append(r)
        

samples=np.array(samples)
plt.plot(samples[:,0],samples[:,1])
plt.savefig('fitness.png')
