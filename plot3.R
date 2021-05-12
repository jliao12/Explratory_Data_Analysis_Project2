NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Load the package
library(ggplot2)

#Subset the NEI data frame with the specified location
NEIBC <- subset(NEI, NEI$fips == "24510")

#Use ggplot to plot the plots
ggplot(data = NEIBC,aes(factor(year), Emissions)) +
  geom_bar(aes(fill = type), stat="identity") +
  facet_grid(cols = vars(NEIBC$type)) +
  ggtitle("PM2.5 Emissions Over 1999-2008 in Baltimore City Monitored in Different Types") +
  theme(plot.title = element_text(hjust = 0.5))+
  xlab("Year") + ylab("PM2.5 (tons)") + labs(fill = "Type")

#Save as PNG
ggsave("plot3.png")

#Except for the point type, the PM2.5 emission of the others were decreasing over 1999 to 2008.
#As for the point type, the emission increased from 1999 to 2005 then decreased in 2008.