# load libraries
library(here)
library(tidyverse)
library(lme4)

a_bar <- 1.5 #  α¯, the average log-odds of survival in the entire population of ponds
sigma <- 1.5 # σ, the standard deviation of the distribution of log-odds of survival among ponds
nstages <- 60 # number of stages
Ni <- rep(c(5, 10, 25, 35) , each = 15) # number of observations in stages

# the values α¯ = 1.4 and σ = 1.5 define a Gaussian distribution of individual pond logodds of survival.
# so now we need to simulate all 60 of these intercept values from the implied
# Gaussian distribution with mean α¯ and standard deviation σ:
set.seed(5005)
# α, a vector of individual stage intercepts, one for each stage
a_stage <- rnorm(nstages, mean = a_bar, sd = sigma)

# create a dataframe from these variables
dsim <- tibble(stage = 1:nstages,
               Ni = Ni ,
               true_a = a_stage)

# now we’re ready to simulate the binomial survival process. each stage i has ni potential survivors, 
# and nature flips each species coin, so to speak, with probability of survival pi
# this probability is defined by the logistic function

# putting the logistic into the random binomial function, we can generate a simulated
# survivor count for each stage
dsim$Si <- rbinom(nstages, prob = plogis(dsim$true_a), size = dsim$Ni)

# compute the no-pooling estimates from proportion of survivors to total observations
dsim$p_nopool <- dsim$Si / dsim$Ni

# these are the same as if we fit 

