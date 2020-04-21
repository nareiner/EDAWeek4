#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Take sum of yearly total emissions
sum <- aggregate(NEI$Emissions, 
        by = list(year = NEI$year), FUN = sum)
#Create the plot
plot(sum$year, sum$x, type = "b",
     ylab = "Total PM2.5 Emissions (tons)",
     xlab = "Year",
     main = "US Emissions by Year")
#Create the png
dev.copy(png, 'plot1.png')
dev.off()
