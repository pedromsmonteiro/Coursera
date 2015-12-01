library(ggplot2)
library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


aa<- filter(NEI, fips == "24510")

bb <- ddply(aa, .(type, year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))
png("plot3.png")
qplot(bb$year,bb$total.emissions, col = bb$type )
dev.off()
