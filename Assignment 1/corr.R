# ===============================
# Part 2: corr function
# ===============================
#

corr <- function(directory, threshold = 0) {
  # 1. Get the dir of the specdata folder
  specdata <- paste(getwd(), "/", directory, "/", sep="")
  
  # 2. Define local variables
  files <- list.files(specdata)
  correlations <- c()
  
  # 3. Filter the observations by the threshold
  obs <- complete(specdata)
  filtered <- subset(obs, (obs$nobs > threshold))
  
  # 5. Get the correlations between nitrate and sulfate of all complete cases.
  for (i in filtered$id) {
    monitor_data <- read.csv(paste(specdata, files[i], sep=""))
    
    complete <- subset(monitor_data, complete.cases(monitor_data))
    
    correlations <- c(correlations, cor(complete$nitrate, complete$sulfate))
    
  }
  
  # 6. Return the correlations
  return(correlations)
}