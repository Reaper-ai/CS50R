library(stringr)
library(testthat)

test_that("`str_length` reutrn length of string",{
     expect_equal(str_length("abcde"),5)
     expect_equal(str_length(c("i","love","R")),c(1,4,1))
})


test_that("`str_length` reutrn NA for NA",{
    expect_equal(str_length(NA),NA_integer_)
})

test_that("`str_length` reutrn len of emoji",{
    expect_equal(str_length("\U0001f60a"),1)
})

test_that("`str_length` return length of special values NaN,Inf",{
  expect_equal(str_length(NaN),3)
  expect_equal(str_length(Inf),3)
  expect_equal(str_length(-Inf),4)
})
