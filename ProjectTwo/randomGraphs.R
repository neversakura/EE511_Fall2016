# This is an example of using iGraph library in R to plot a random graph
#
# Author: Huo Chen
#
# Revison History
# ============================================================================
# First commit                                                       9/22/1988
g <- sample_gnp(20,0.5)  # Generate a binomial graph with 20 nodes
plot(g)
