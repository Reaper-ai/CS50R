random_character <- function() {
  return(sample(letters, 20, replace = TRUE, prob = NULL))
}

print_sequence <- function(length) {
  seq <- random_character()
  for (i in seq){
    cat(i)
    Sys.sleep(0.25)

  }
}

print_sequence()