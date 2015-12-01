library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aa <- ddply(NEI, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))
png("plot1.png")
plot(aa)
dev.off()

