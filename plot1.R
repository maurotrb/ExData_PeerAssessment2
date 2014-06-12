# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.

# Required libraries
require(dplyr)

# Compute aggregations to use with plot
emission_per_year <- NEI %.%
  group_by(year) %.%
  summarise(total_emissions = sum(Emissions))

# Plot 1
png('plot1.png')
with(emission_per_year, plot(year, total_emissions, type="l", main = "Plot 1 - Total emissions per year"))
dev.off()

# Answer
# Total emissions from PM2.5 had decreased in the United States from 1999 to 2008
