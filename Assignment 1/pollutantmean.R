# ===============================
# Part 1: pollutantmean function
# ===============================
# Calculates the mean of a pollutant over a set of monitors

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # 1) Define local variables
  files <- list.files(directory)
  monitors <- NA
  
  # 2) Get the dir of the csvs
  csv_dir <- paste(getwd(), "/", directory, "/", sep="")
  
  # 3) Get all data for the monitors 
  for (i in id) {
    monitor_data <- read.csv(paste(csv_dir, files[i], sep=""))
    monitors <- rbind(monitors, monitor_data)
  }
  
  # 4) Calculate the mean of the pollutant for all monitors
  mean_pollutant <- mean(data[[pollutant]], na.rm=TRUE)
  
  # 5) Return mean of the pollutant
  return(mean_pollutant)
}