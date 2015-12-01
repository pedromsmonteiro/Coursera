library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Q2 <-filter(NEI, fips == "24510")
aa <- ddply(Q2, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))
png("plot2.png")
plot(aa)
dev.off()