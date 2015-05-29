# Set root
proj_root <- getwd()

# Unzip data (if necessary)
if(!all(
  c('spray.csv', 'test.csv', 'train.csv', 'weather.csv') %in% 
    dir('data/unzipped'))){
  source('unzip.R')
}

# Read in data
setwd(paste0(proj_root, '/data/unzipped'))
files <- dir()[grepl('.csv', dir())]
for (i in 1:length(files)){
  file <- files[i]
  filename <- gsub('.csv', '', file)
  assign(filename, read.csv(file))
  cat(paste('Reading', file, '\n'))
}
rm(file, filename, files, i)

# Format dates
test$Date <- as.Date(test$Date)
train$Date <- as.Date(train$Date)

# Return to directory
setwd(proj_root)