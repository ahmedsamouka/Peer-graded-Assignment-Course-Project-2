> NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
> SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
> library(ggplot2)
> try <- aggregate(Emissions ~ year + type, maryland, sum)
> View(try)
> g <- ggplot(try, aes(year, Emissions, color = type))
> g + geom_line() +
+     xlab("Year") +
+     ylab(expression("Total PM"[2.5]*" Emissions")) +
+     ggtitle("Total Emissions per type in Baltimore")