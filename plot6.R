# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == "06037").
# Which city has seen greater changes over time in motor vehicle emissions?

# Required libraries
require(dplyr)
require(ggplot2)

# Compute aggregations to use with plot
emission_per_year_vehicle_baltimore_la <- NEI %.%
  inner_join(SCC) %.%
  filter(grepl("Vehicles", EI.Sector) & (fips == "24510" | fips == "06037")) %.%
  group_by(year, fips) %.%
  summarise(total_emissions = sum(Emissions))
emission_per_year_vehicle_baltimore_la[emission_per_year_vehicle_baltimore_la$fips == "24510", 2] <- "Baltimore City"
emission_per_year_vehicle_baltimore_la[emission_per_year_vehicle_baltimore_la$fips == "06037", 2] <- "Los Angeles County"

# Plot 6
png('plot6.png', width=960)
qplot(year, total_emissions, data = emission_per_year_vehicle_baltimore_la, facets = . ~ fips, geom = "line", main = "Plot 6 - Total emissions per year by Vehicles in Baltimore City and Los Angeles County")
dev.off()

# Answer
# Baltimore City has seen the greater changes from 1999-2008 in motor vehicle emissions.
# Los Angeles County, after a spike in 2005, returned to 1999 levels by 2008.
