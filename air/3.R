load("air.RData")
air3 <- filter(air, county == "OR - Yamhill")
save(air3, file="3.RData")