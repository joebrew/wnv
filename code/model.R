# Set root
proj_root <- getwd()

# Source the cleaning script
source('code/clean.R')

# Load some modeling libraries
library(mgcv)
library(randomForest)
library(caret)

# Fit large GAM 
fit <- bam(WnvPresent ~ 
             s(Latitude, Longitude, bs = 'ad'),
           data = train, 
           family = binomial('logit'))
vis.gam(fit)
vis.gam(fit, view = c('Latitude', 'Longitude'),
        n.grid = 200,
        plot.type = 'contour',
        type = 'response')

# Predict using GAM on test
predicted <- predict(fit, test)
