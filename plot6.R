#Use ggplot2
library(ggplot2)
#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore and LA with type On-Road
Car <- subset(NEI, NEI$fips=="24510" | NEI$fips=="06037" &
                    NEI$type=="ON-ROAD")
sumCar <- aggregate(Car$Emissions, 
                    by=list(Car$fips, Car$year),
                    FUN = sum)
colnames(sumCar) <- c("City", "Year", "Emissions")
#Create plot
data <- qplot(Year, Emissions, data = sumCar, color = City,
              geom = "line") + 
              ylab("Total PM2.5 Emissions (tons)") +
              xlab("Year") +
              ggtitle("Baltimore (24510) and LA (06037) Motor Vehicle Emissions by Year")
data
#Create the png
dev.copy(png, 'plot6.png')
dev.off()