#Read emissions data (NEI) and classification code (SCC)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#Get coal data
coalCC <- SCC[grep("Coal", SCC$Short.Name),]
coalData <- NEI[NEI$SCC %in% coalCC$SCC,]
#Take sum of coal emissions by year
coalYear <- aggregate(coalData$Emissions,
                      by = list(coalData$year),
                      FUN = sum)
colnames(coalYear) <- c("year", "emissions")
#Create plot
plot(coalYear$year, coalYear$emissions, type = "b",
     ylab = "Total PM2.5 Emissions (tons)",
     xlab = "Year",
     main = "US Coal Emissions by Year")
#Create the png
dev.copy(png, 'plot4.png')
dev.off()