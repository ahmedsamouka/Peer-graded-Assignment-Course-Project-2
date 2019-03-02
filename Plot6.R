> NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
> SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
> vebalt  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
> vescc <- SCC[vebalt, ]
> mrg1 <- merge(maryland, vescc, by = "SCC")
> losan <- subset(NEI, fips == "06037")
> mrg1$city <- "Baltimore"
> mrg2 <- merge(losan,vescc, by = "SCC")
> mrg2$city <- "Los Angeles"
> baltlos <- rbind(mrg1,mrg2)
> baltlos2 <- aggregate(Emissions ~ year + city, baltlos, sum)
> q <- qplot(baltlos2, aes(year, Emissions, col = city))
> g + geom_line() + xlab("year") + ylab("total Emissions") + ggtitle("total Emissions in Baltimore vs Los Angeles") 
> q + geom_line() + xlab("year") + ylab("total Emissions") + ggtitle("total Emissions in Baltimore vs Los Angeles")
> q <- ggplot(baltlos2, aes(year, Emissions, color = city))
> q + geom_line() + xlab("year") + ylab("total Emissions") + ggtitle("total Emissions in Baltimore vs Los Angeles")