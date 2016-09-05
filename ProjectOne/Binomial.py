# This is a simple example using numpy and matplotlib to generate binomial random
# experiments
#
# Author: Huo Chen
#
# Revison History
# ===========================================================================
# First commit                                                       9/4/2016

import numpy as np
import matplotlib.pyplot as plt

# generate binomiaal random experiments
binomialExample=np.random.binomial(10,0.5,10000)

# the histogram of the data
n ,bins, patches = plt.hist(binomialExample, bins=10, normed=True)

# axis labels and title
plt.xlabel('Bins')
plt.ylabel('Frequencies')
plt.title('Example Binomial Random Variable Bin Plot')
plt.show()
