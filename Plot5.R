> NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
> SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")
> vebalt  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
> vescc <- SCC[vebalt, ]
> View(maryyear)
> mrg1 <- merge(maryland, vescc, by = "SCC")
> View(mrg1)
> totalpm1 <- tapply(mrg1$Emissions, mrg1$year, sum)
> barplot(totalpm1, xlab = "year", ylab = "total Emission", main = "Emmision in Baltimore city from Vechicle")