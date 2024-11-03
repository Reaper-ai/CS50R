library("testthat")

test_that("check summary_brands",{
  expect_no_error(summary_brands())
})
test_that("check summary_gender",{
  expect_no_error(summary_gender())
})
test_that("check summary_os",{
  expect_no_error(summary_os())
})
test_that("check summary_ubc",{
  expect_no_error(summary_ubc())
})
test_that("check summary_daily_usage",{
  expect_no_error(summary_daily_usage())
})
test_that("check summary_battery_usage",{
  expect_no_error(summary_battery_usage())
})
test_that("check summary_screen_time",{
  expect_no_error(summary_screen_time())
})
test_that("check summary_app_usage",{
  expect_no_error(summary_app_usage())
})
test_that("check summary_apps",{
  expect_no_error(summary_apps())
})
test_that("check summary_age",{
  expect_no_error(summary_age())
})
