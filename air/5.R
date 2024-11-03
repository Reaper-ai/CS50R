load("air.RData")
air5 <- group_by(air,county) |>
        arrange(desc(emissions)) |>
        slice_head()

air <- air5
save(air, file="5.RData")