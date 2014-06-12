# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make
# a plot answering this question.

# Required libraries
require(dplyr)

# Compute aggregations to use with plot
emission_per_year_baltimore <- NEI %.%
  filter(fips == "24510") %.%
  group_by(year) %.%
  summarise(total_emissions = sum(Emissions))

# Plot 2
png('plot2.png')
with(emission_per_year_baltimore, plot(year, total_emissions, type="l", main = "Plot 2 - Total emissions per year. Baltimore."))
dev.off()

# Answer
# Total emissions from PM2.5 decreased in the Baltimore City, Maryland
# from 1999 to 2008, but with a spike in 2005.
