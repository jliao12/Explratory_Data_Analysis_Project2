NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the NEI data frame with the specified location
NEIBC <- subset(NEI, NEI$fips == "24510")

#Get the sum of emission of each year
pmBCsum <- with(NEIBC,tapply(NEIBC$Emissions, NEIBC$year, sum, na.rm = T))

#Get the range of the emission
rg <- range(pmBCsum)

#Plot the barplot
barplot(pmBCsum, main = "Total PM2.5 Emission Over Years in Baltimore City", xlab = "Year", ylab = 
          "PM2.5 (tons)", ylim = c(0,rg[2]+500))

#Save as png
dev.copy(png,file = "plot2.png")
dev.off()

#In general, the total PM2.5 emission over 1999 to 2008 is decreasing in Baltimore
# City, only in 2005, the total emission was higher than that in 2002, but lower than 1999.