# This is a simple example using R to generate binomial random experiments

# Author: Huo Chen

# Revison History
# ============================================================================
# First commit                                                       9/4/2016

# generate binomiaal random experiments
binomialExample <- rbinom(10000, 10, 0.5)

# the histogram of the data
barplot(table(binomialExample), main='Example Binomial Random Variable Bin Plot', xlab="Bins", ylab="Frequencies")
