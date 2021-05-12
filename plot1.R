NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Load the required package
library(dplyr)

#Subset the NEI data frame with the specified years
NEIS <- subset(NEI, year == 1999 | year == 2002 | year == 2005 | year == 2008)
pmsum <- with(NEIS,tapply(NEIS$Emissions, NEIS$year, sum, na.rm = T))
barplot(pmsum, main = "Total PM2.5 Emission Over Years", xlab = "Year", ylab = 
          "PM2.5 (tons)", ylim = c(0,8e+6))
dev.copy(png,file = "plot1.png")
dev.off()