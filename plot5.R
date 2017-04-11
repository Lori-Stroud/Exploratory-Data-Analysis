# Exploratory Data Analysis - Assignment 2 - Q. #5

# Load ggplot2 library
library(ggplot2)

# Loading provided datasets - loading from local machine
NEI <- readRDS("/Users/hhj/Documents/Lori/coursera/Project-2/exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/Users/hhj/Documents/Lori/coursera/Project-2/exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Baltimore City, Maryland == fips
MD.onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
MD.df <- aggregate(MD.onroad[, 'Emissions'], by=list(MD.onroad$year), sum)
colnames(MD.df) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 

# Generate the graph in the same directory as the source code
png(filename='/Users/hhj/Documents/Lori/coursera/Project-2/plot5.png')

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()
