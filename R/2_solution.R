# load the here package
library(here)

# look where your rootdirectory is pointing to 
here()

# the dataset that we are using is located in the subfolder data/ and called "Harnik2011_data.csv"
dat_harnik <- read.csv(here("data", "Harnik2011_data.csv"))

# use the mean function to calculate the mean duration across all occurrences
mean(dat_harnik$duration)


# model the mean across all observations with a intercept-only glm
# use a poisson distribution for count data
# assign this to the variable mod1
mod1 <- glm(duration ~ 1, 
            data = dat_harnik, 
            family = "poisson")

# use the coef function to get the estimated intercept of the model
# assign it to the variable dat_intercept
dat_intercept <- coef(mod1)

# find out what link function the poisson model is using by looking at the help description of family()
?family()

# retransform estimated coefficient by using the reverse link 
exp(dat_intercept)

# compare the estimate for the intercept with the mean that you calculated above.
# does the model give us the same mean?

