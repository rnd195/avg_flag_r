library(png)
library(grid)
library(dplyr)
library(data.table)
library(rstudioapi)

#### Regions ####
# set working directory to the file path
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
setwd("regions")
# setwd("districts") # for the other example flag

files <- list.files(pattern = ".png$")

# apply the readPNG function to all the images
all_flags <- sapply(files, readPNG, simplify = FALSE) %>% bind_rows()
all_flags_summed <- Reduce("+", all_flags)

avg <- all_flags_summed / length(files)
imgmatrix <- matrix(avg, nrow = 200)
dim(imgmatrix)

# remap the matrix
r <- imgmatrix[1:200, 1:300]
g <- imgmatrix[1:200, 301:600]
b <- imgmatrix[1:200, 601:900]

# create colors based on red, green and blue values
avg_col <- rgb(r, g, b)
dim(avg_col) <- dim(r)

grid.raster(avg_col, interpolate = FALSE) # output
