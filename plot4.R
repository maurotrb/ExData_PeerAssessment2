# Read raw data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Question
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

# Required libraries
require(dplyr)
require(ggplot2)

# Compute aggregations to use with plot
emission_per_year_coal_combustion <- NEI %.%
  inner_join(SCC) %.%
  filter(grepl("Coal", EI.Sector) & grepl("Combustion", SCC.Level.One)) %.%
  group_by(year) %.%
  summarise(total_emissions = sum(Emissions))

# Plot 4
png('plot4.png')
qplot(year, total_emissions, data = emission_per_year_coal_combustion, geom = "line", main = "Plot 4 - Total emissions per year by Coal combustion")
dev.off()

# Answer
# Total emissions from coal combustion-related sources had decreased from 1999-2008.
