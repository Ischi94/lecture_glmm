# The here package is one of the best inventions in the R universe. It allows you to the reference the
# location of an .Rproj file and uses that as a root directory. This means that you will never have to 
# set your directory again, and just use here() instead

# install the here package
install.packages("here")

# load the here package
library(here)

# look where your rootdirectory is pointing to 
here()

# the dataset that we are using is located in the subfolder data/ and called "Harnik2011_data.csv"
# using the here function, we can load it like this and assign it to a variable 
dat_harnik <- read.csv(here("data", "Harnik2011_data.csv"))

# use the mean function to calculate the mean duration across all occurrences
mean(dat_harnik$duration)


# model the mean across all observations with a intercept-only glm
# use a poisson distribution for count data
# assign this to the variable mod1
mod1 <- glm(duration ~ 1, 
            data = dat_harnik, 
            family = "poisson")

# use the summary function to look at the output of the model
summary(mod1)

# compare the estimate for the intercept with the mean that you calculated above.
# does the model give us the same mean?

