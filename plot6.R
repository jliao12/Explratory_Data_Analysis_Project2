NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the NEI data frame with the specified location
NEIBCLA <- subset(NEI, NEI$fips == "24510" | NEI$fips == "06037")

#Subset the SCC data that contain Vehicle
SCCVehicle <- subset(SCC, grepl("Vehicle",SCC.Level.Two))

#Filter the NEIBCLA data frame with only the SCC included in SCCVehicle
NEIBCLAMobile <- filter(NEIBCLA, NEIBCLA$SCC %in% SCCVehicle$SCC)

#Use ggplot to plot the plots
NEIBCLAMobile$fips <- as.factor(NEIBCLAMobile$fips)
levels(NEIBCLAMobile$fips) <- c("LA County", "Baltimore City")

ggplot(data = NEIBCLAMobile,aes(factor(year), Emissions)) +
  geom_bar(aes(fill = fips), stat="identity") +
  facet_grid(cols = vars(NEIBCLAMobile$fips)) +
  ggtitle("Vehicle Based PM2.5 Emissions Over 1999-2008 in LA County and Baltimore City") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("Year") + ylab("PM2.5 (tons)") + labs(fill = "Area")

#Save as PNG
ggsave("plot6.png")

#Compare to Baltimore City, the vehicle based emission in LA County was much more than that in Baltimore city
#And in general, the vehicle based emission was not decreased from 1999 to 2008.