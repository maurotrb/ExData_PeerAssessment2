# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
# variable, which of these four sources have seen decreases in emissions from 1999–2008
# for Baltimore City? Which have seen increases in emissions from 1999–2008?
# Use the ggplot2 plotting system to make a plot answer this question.

# Required libraries
require(dplyr)
require(ggplot2)

# Compute aggregations to use with plot
emission_per_year_type_baltimore <- NEI %.%
  filter(fips == "24510") %.%
  group_by(year, type) %.%
  summarise(total_emissions = sum(Emissions))
emission_per_year_type_baltimore$type <- as.factor(emission_per_year_type_baltimore$type)

# Plot 3
png('plot3.png', width = 960)
qplot(year, total_emissions, data = emission_per_year_type_baltimore, facets = . ~ type, geom = "line", main = "Plot 3 - Total emissions per year by Type of sources. Baltimore City.")
dev.off()

# Answer
# Total emissions in Baltimore City had decreased from 1999-2088 for nonpoint,
# on-road, non-road type of sources. Even for point type of source the emissions
# decreased, but with a spike in 2005.
