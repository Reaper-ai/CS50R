report20 <- read.csv("2020.csv")
report21 <- read.csv("2021.csv")
report22 <- read.csv("2022.csv")
report23 <- read.csv("2023.csv")
report24 <- read.csv("2024.csv")

report <- list(report20, report21, report22, report23, report24)

country <- readline("Enter country: ")

yr <- 2020

for (year in report){
  if (country %in% year$country){
    score <- sum(year[which(year$country == country),-1])
    print(paste(yr,": ",round(score,digits = 2)))
  } else {
      print(paste(yr,": unavailable"))
  }

  yr <- yr + 1

}