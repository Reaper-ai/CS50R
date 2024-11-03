library(testthat)

test_that("check relation_screen_time_to_app_time ",{
  expect_no_error(relation_screen_time_to_app_time())
})

test_that("check relation_screen_time_to_data",{
  expect_no_error(relation_screen_time_to_data())
})
test_that("check relation_screen_time_to_app_no",{
  expect_no_error(relation_screen_time_to_app_no())
})
test_that("check relation_screen_time_to_ubc",{
  expect_no_error(relation_screen_time_to_ubc())
})
test_that("check relation_screen_time_to_age",{
  expect_no_error(relation_screen_time_to_age())
})
test_that("check relation_screen_time_to_gender",{
  expect_no_error(relation_screen_time_to_gender())
})
test_that("check relation_brand_to_data",{
  expect_no_error(relation_brand_to_data())
})
test_that("check relation_brand_to_ubc",{
  expect_no_error(relation_brand_to_ubc())
})
test_that("check relation_brand_to_gender",{
  expect_no_error(relation_brand_to_gender())
})
test_that("check relation_brand_to_age",{
  expect_no_error(relation_brand_to_age())
})
