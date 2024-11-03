library("testthat")
source("believe.R")
long_seq <- paste0(sample(c("A", "T", "G", "C"), 12000, replace = TRUE), collapse = "")
long_motif <- paste0(sample(c("A", "T", "G", "C"), 150, replace = TRUE), collapse = "")
long_motifs <- replicate(101, paste0(sample(c("A", "T", "G", "C"), sample(1:10, 1), replace = TRUE), collapse = ""))


test_that("`find_motifs` throws error when invalid DNA is given",{
    expect_error(find_motifs("ATGCGATAZGCTT",c("ATG", "CGT", "TAC")))
    expect_error(find_motifs("",c("ATG", "CGT", "TAC")))
    expect_error(find_motifs("AT",c("ATG", "CGT", "TAC")))
})


test_that("`find_motifs` throws warning when length constraints are voilated",{
    expect_warning(find_motifs(long_seq,c("ATG", "CGT", "TAC")))
    expect_warning(find_motifs("ATGCGATACGTCTT",c(long_motif, "CGT", "TAC")))
    expect_warning(find_motifs("ATGCGATACGTCTT",c("", "CGT", "TAC")))

})


test_that("`find_motifd` throws error when wrong input is given",{
  expect_error(find_motifs(24566,c("ATG", "CGT", "TAC")))
  expect_error(find_motifs(NaN,c("ATG", "CGT", "TAC")))
  expect_error(find_motifs("ATGCGATACGTCTT",34))
  expect_error(find_motifs("ATGCGATACGTCTT",c(89, "CGT", "TAC")))
  expect_error(find_motifs("ATGCGATACGTCTT",c(NA, "CGT", "TAC")))
})


test_that("`find_motif` return correct output",{
  expect_equal(find_motifs("ATGCGATACGTCTT",c("ATG", "CGT", "TAC")),list("ATG" = c(1),"CGT" = c(9), "TAC" = c(7)))
})