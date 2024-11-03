load("air.RData")

air7 <- group_by(air,level_1,pollutant) |>
        summarise(emissions = sum(emissions))|>
        ungroup()

air <- rename(air7, source= "level_1")
save(air, file="7.RData")