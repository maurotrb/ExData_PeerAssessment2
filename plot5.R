# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Required libraries
require(dplyr)
require(ggplot2)

# Compute aggregations to use with plot
emission_per_year_vehicle_baltimore <- NEI %.%
  inner_join(SCC) %.%
  filter(grepl("Vehicles", EI.Sector) & fips == "24510") %.%
  group_by(year) %.%
  summarise(total_emissions = sum(Emissions))

# Plot 5
png('plot5.png')
qplot(year, total_emissions, data = emission_per_year_vehicle_baltimore, geom = "line", main = "Plot 5 - Total emissions per year by Vehicles in Baltimore")
dev.off()

# Answer
# Total emissions in Baltimore City from vehicles-related sources had decreased from 1999-2008.
