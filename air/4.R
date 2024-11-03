load("air.RData")
air4 <- filter(air, county == "OR - Yamhill") |> arrange(desc(emissions))
air <- air4
save(air, file="4.RData")
