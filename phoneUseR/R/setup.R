
load_mydata <- function() {
  data_env <- new.env()
  load(system.file("data", "dataset.Rdata", package = "phoneUseR"), envir = data_env)
  return(data_env$rdata)
}

setup_ <- function() {
filepath <- system.file("extdata", "user_behavior_dataset.csv", package = "phoneUseR")
rdata <- read_csv(file=filepath, show_col_types=FALSE
                  )
rdata <- clean_names(rdata)

rdata <- mutate(rdata,
                brand = str_extract(device_model, "^\\w+"))

save(rdata, file=system.file("data", "dataset.Rdata", package = "phoneUseR"))

return("Data loaded succesfully")
}
