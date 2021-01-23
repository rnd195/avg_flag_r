library(png)
library(grid)
library(dplyr)
library(data.table)
library(rstudioapi)

#### Regions ####
# set working directory to the file path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("districts")
# setwd("regions") # for the other example flag

files <- list.files(pattern = ".png$")

all_flags <- sapply(files, readPNG, simplify = FALSE) %>% bind_rows()

#### Average ####
# Sum all the values w/ respect to their position
all_flags_summed <- Reduce("+", all_flags)
avg <- all_flags_summed / length(files)

# Turn the array into a matrix
imgavg <- matrix(avg, nrow = 200)

#### Median ####
# Prepare an empty vector
median_arr <- array(1, dim = dim(all_flags[[1]]))

# Beware that this codeblock takes a while (1-2 mins)
# TODO optimize
for (hgt in 1:dim(median_arr)[1]){
  for (wth in 1:dim(median_arr)[2]){
    # No need to iterate through the alpha levels
    for (clr in 1:3){
      temp_vec <- c(rep(NA, ncol(all_flags)))
      for (vars in 1:ncol(all_flags)){
        temp_vec[vars] <- all_flags[[vars]][hgt, wth, clr]
      }
      median_arr[hgt, wth, clr] <- median(temp_vec)
    }
  }
}

imgmedian <- matrix(median_arr, nrow = 200)



# Remap the matrix
r_avg <- imgavg[1:200, 1:300]
r_med <- imgmedian[1:200, 1:300]
g_avg <- imgavg[1:200, 301:600]
g_med <- imgmedian[1:200, 301:600]
b_avg <- imgavg[1:200, 601:900]
b_med <- imgmedian[1:200, 601:900]

# Create colors based on red, green and blue values
avg_col <- rgb(r_avg, g_avg, b_avg)
med_col <- rgb(r_med, g_med, b_med)
dim(avg_col) <- dim(r_avg)
dim(med_col) <- dim(r_med)

# Output
grid.raster(avg_col, interpolate = FALSE)
grid.raster(med_col, interpolate = FALSE)
