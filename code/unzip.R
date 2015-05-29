# Go to data directory
proj_root <- getwd()
setwd(paste0(proj_root, '/data'))

# Unzip
zipped_files <- dir('zipped')[which(grepl('.zip', dir('zipped')))]
sapply(zipped_files, 
       function(x){unzip(paste0('zipped/', x), exdir ='unzipped')})
