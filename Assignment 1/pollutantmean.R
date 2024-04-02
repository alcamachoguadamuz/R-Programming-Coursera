# ===============================
# Part 1: pollutantmean function
# ===============================
# Calculates the mean of a pollutant over a set of monitors

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # 1. Get the dir of the specdata folder
  specdata <- paste(getwd(), "/", directory, "/", sep="")
  
  # 2. Define local variables
  specdata_files <- list.files(specdata)
  monitors <- NA
  
  # 3. Get all data for the monitors 
  for (i in id) {
    # 3.1. Get the monitor's data
    monitor_dir <- paste(specdata, specdata_files[i], sep="")
    monitor_data <- read.csv(monitor_dir)
    
    # 3.2. Store the monitor's data
    monitors <- rbind(monitors, monitor_data)
  }
  
  # 4. Calculate the mean of the pollutant for all monitors
  monitors_mean <- mean(monitors[[pollutant]], na.rm=TRUE)
  
  # 5. Return the mean of the pollutant across all monitors
  return(monitors_mean)
}