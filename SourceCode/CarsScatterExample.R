##############
# Make cars scatter plot (example R script origingally for source_url blog post)
# Christopher Gandrud
# 10 July 2012
##############

# Make cars scatter plot
  library(ggplot2)
  Plot <- qplot(cars$dist, cars$speed) +
                theme_bw()
  print(Plot)