# This is an example of using networkx library in Python to plot a random graph
#
# Author: Huo Chen
#
# Revison History
# ============================================================================
# First commit                                                       9/20/1988
import networkx as nx
import matplotlib.pyplot as plt

G=nx.gnp_random_graph(20,0.5)   # Generate a binomial graph with 20 nodes
nx.draw(G)
plt.show()
