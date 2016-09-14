# This is a simple illustration for bootstrapping method in python
#
# Author: Huo Chen
#
# Revison History
# ===========================================================================
# First commit                                                       9/13/2016

import numpy as np
from sklearn.utils import resample
import matplotlib.pyplot as plt

# reading the data
with open('NJGAS.dat','r') as dataFile:
    sample=np.fromstring(dataFile.read(),dtype=int,sep='\n')

meanEstimator=np.empty([1000,1])

# resample the data
for index in range(0,1000):
    resampleData=resample(sample)
    meanEstimator[index]=np.mean(resampleData)

n ,bins, patches = plt.hist(meanEstimator, bins=10)

# axis labels and title
plt.xlabel('Bins')
plt.ylabel('Frequencies')
plt.title('Bootstrapping Example Plot')
plt.show()
