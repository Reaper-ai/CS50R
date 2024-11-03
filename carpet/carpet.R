calculate_growth_rate <- function(years, visitors) {
  total_yrs <- length(years)

  growth <- visitors[total_yrs] - visitors[1]
  avg_growth <- growth / (total_yrs-1)
  return(avg_growth)

}

predict_visitors <- function(years, visitors, year) {
  latest <- length(years)
  rate <- calculate_growth_rate(years,visitors)

  if (latest < year){
    visits <- visitors[latest] + rate*(year-years[latest])
  } else {
    visits <- visitors[latest]
  }
  return(visits)

}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
