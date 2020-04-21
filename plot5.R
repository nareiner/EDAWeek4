#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore with type On-Road
baltCar <- subset(NEI, NEI$fips=="24510" &
                    NEI$type=="ON-ROAD")
#Take sum of yearly total emissions
balt_Car <- aggregate(baltCar$Emissions, 
                       by = list(baltCar$year), 
                       FUN = sum)
colnames(balt_Car) <- c("Year", "Emissions")
#Create plot
plot(balt_Car$Year, balt_Car$Emissions,type = "b",
     ylab = "Total PM2.5 Emissions (tons)",
     xlab = "Year",
     main = "Baltimore Motor Vehicle Emissions by Year")
#Create the png
dev.copy(png, 'plot5.png')
dev.off()