NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the NEI data frame with the specified location
NEIBC <- subset(NEI, NEI$fips == "24510")

#Subset the SCC data that contain Vehicle
SCCVehicle <- subset(SCC, grepl("Vehicle",SCC.Level.Two))

#Filter the NEIBC data frame with only the SCC included in SCCVehicle
NEIBCMobile <- filter(NEIBC, NEIBC$SCC %in% SCCVehicle$SCC)

#Get the sum of the emission of each year
pmsumBCMobile <- with(NEIBCMobile,tapply(Emissions, year, sum, na.rm = T))

#Plot the bar chart
barplot(pmsumBCMobile, main = "Total Vehicle Based PM2.5 Emission Over Years in Baltimore City", xlab = "Year", ylab = 
          "PM2.5 (tons)", ylim = c(0,450))

#Save as png
dev.copy(png,file = "plot5.png")
dev.off()

#In general, the vehicle based PM2.5 emission decreased in Baltimore City from 1999 to 2008.