setwd("Dropbox/Data_science/Exploratory data analysis/project_2/")
library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aa <- group_by(NEI, year)
tapply(NEI$Emissions, INDEX = NEI$year, sum)
aa <- ddply(NEI, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))