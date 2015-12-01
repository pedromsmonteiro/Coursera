library(ggplot2)
library(plyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

w <- c("Vehicles","Mobile")
zz <- subset(SCC,grepl(paste(w, collapse="|"), EI.Sector))

bla <- merge(NEI, zz, by.y = "SCC")

bal <-subset(bla, fips == "24510")
la <- subset(bla, fips == "06037")
aa <- ddply(bal, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))
bb <- ddply(la, .(year), summarise, total.emissions = sum(Emissions, na.rm = TRUE))

png("plot6.png")

par(mfcol = c(1,2))
plot(aa$year,aa$total.emissions)
plot(bb$year,bb$total.emissions)
dev.off()
