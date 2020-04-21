#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Subset Baltimore then take sum of yearly total emissions
balt <- subset(NEI, NEI$fips=="24510")
balt_sum <- aggregate(balt$Emissions, 
                 by = list(balt$year), FUN = sum)
#Create the plot
plot(balt_sum$Group.1, balt_sum$x, type = "b",
     ylab = "Total PM2.5 Emissions (tons)",
     xlab = "Year",
     main = "Baltimore Emissions by Year")
#Create the png
dev.copy(png, 'plot2.png')
dev.off()
