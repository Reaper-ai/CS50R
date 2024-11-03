load("air.RData")
air6 <- group_by(air,pollutant) |>
        summarise(emissions = sum(emissions)) |>
        ungroup()|>
        arrange(desc(emissions))

air <- air6
save(air, file="6.RData")