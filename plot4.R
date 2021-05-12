NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalSCC <- subset(SCC, grepl("^.+(Coal)$",EI.Sector))

NEIcoal <- filter(NEI,NEI$SCC %in% coalSCC$SCC)

#Get the sum of the emission of each year
pmsumcoal <- with(NEIcoal,tapply(Emissions, year, sum, na.rm = T))

#Plot the bar chart
barplot(pmsumcoal, main = "Total Coal Based PM2.5 Emission Over Years", xlab = "Year", ylab = 
          "PM2.5 (tons)", ylim = c(0,6e+5))

#Save as png
dev.copy(png,file = "plot4.png")
dev.off()

#In general, the coal based pm2.5 emission decreased from 1999 to 2008