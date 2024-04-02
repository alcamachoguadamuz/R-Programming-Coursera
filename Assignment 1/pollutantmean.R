# ===============================
# Part 1: pollutantmean function
# ===============================
# Calculates the mean of a pollutant over a set of monitors

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # 1. Get the dir of the specdata folder
  specdata <- paste(getwd(), "/", directory, "/", sep="")
  
  # 2. Define local variables
  files <- list.files(specdata)
  monitors <- c()
  
  # 3. Get all data for the monitors 
  for (monitor in id) {
    # 3.1. Get the monitor's data
    monitor_data <- read.csv(paste(specdata, files[i], sep=""))
    
    # 3.2. Store the monitor's data
    monitors <- rbind(data, monitor_data)
  }
  
  # 4) Calculate the mean of the pollutant for all monitors
  mean_pollutant <- mean(data[[pollutant]], na.rm=TRUE)
    
  # 5) Return mean of the pollutant
  return(mean_pollutant)
}