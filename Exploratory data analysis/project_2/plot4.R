library(ggplot2)
library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


zz <- subset(SCC,grepl("Coal", EI.Sector))

bla <- merge(NEI, zz, by.y = "SCC")
aa <- ddply(bla, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))
png("plot4.png")
plot(aa$year,aa$total.emissions)
dev.off()
