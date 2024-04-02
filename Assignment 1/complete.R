# ===============================
# Part 2: complete function
# ===============================
# Reports the number of completely observed cases in each monitor.

complete <- function(directory, id = 1:332) {
  # 1. Get the dir of the specdata folder
  specdata <- paste(getwd(), "/", directory, "/", sep="")
  
  # 2. Define local variables
  specdata_files <- list.files(specdata)
  ids <- c()
  nobs <- c()
  
  # 3. For each monitor, add its id and number of complete cases
  #    to respective vectors.
  for (i in id) {
    monitor_data <- read.csv(paste(specdata, specdata_files[i], sep=""))
    
    ids <- c(ids, i)
    nobs <- c(nobs, sum(complete.cases(monitor_data)))
  }
  
  # 4. Create the data frame of complete cases per monitor
  comp <- data.frame(ids, nobs)
  
  # 5. Return the complete cases
  return(comp)
}