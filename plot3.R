#Use ggplot2
library(ggplot2)
#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore
balt <- subset(NEI, NEI$fips=="24510")
#Take sum of yearly total emissions by type
balt_type <- aggregate(balt$Emissions, 
                      by = list(balt$type, balt$year), 
                      FUN = sum)
colnames(balt_type) <- c("Type", "Year", "Emissions")
#Create plot
data <- qplot(Year, Emissions, data = balt_type, color = Type,
          geom = "line") + 
          ylab("Total PM2.5 Emissions (tons)") +
          xlab("Year") +
          ggtitle("Baltimore Pollutant Emissions by Year")
data
#Create the png
dev.copy(png, 'plot3.png')
dev.off()