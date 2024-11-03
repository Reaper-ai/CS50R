library("testthat")

test_that("test if setup is working",
          {
           expect_no_error(setup_())
          })
