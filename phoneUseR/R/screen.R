

relation_screen_time_to_gender <- function(){
  sdata <- rdata |>
    group_by(gender) |>
    summarise(count= n(), total_screen_time = sum(screen_on_time_hours_day)) |>
    mutate(mean_screen_time = total_screen_time/count)

    ggplot(sdata,aes(y=mean_screen_time, x=gender,fill=gender,group=gender)) +
    geom_col() +
    labs(title = "Average male and female screen time is roughly same",
         x = "User Gender",
         y = "Avg. Screen time (hrs/day)") +
    annotate("label", x = 1, y = 5.4,
             label = round(sdata$mean_screen_time[1],2),
             color = "black",
             label.size = 0.5, size = 4, hjust = 0.5) +
      annotate("label", x = 2, y = 5.42,
               label = round(sdata$mean_screen_time[2],2),
               color = "black",
               label.size = 0.5, size = 4, hjust = 0.5) +
    theme_classic()

}

relation_screen_time_to_age <- function(){
  rdata |>
    group_by(age) |>
    summarise(count= n(), total_screen_time = sum(screen_on_time_hours_day)) |>
    mutate(mean_screen_time = total_screen_time/count) |>
    ggplot() +
    geom_col(aes(x=age,y=mean_screen_time), fill = "lightblue") +
    labs( x= "User Age",
          y = "Avg. screen time (hrs/day)",
          title = "No particular trend in age vs avg screen time",
          subtitle = "Users with minimum screen time = 36 yrs old\nUsers with maximum screen time = 47 yrs old") +
    theme_classic()
}

relation_screen_time_to_ubc <- function(){
  rdata |>
    group_by(user_behavior_class) |>
    summarise(count= n(), total_screen_time = sum(screen_on_time_hours_day)) |>
    mutate(mean_screen_time = total_screen_time/count) |>
    ggplot() +
    geom_col(aes(x=user_behavior_class,y=mean_screen_time), fill = "lightblue") +
    labs( x= "User Behaviour Class",
          y = "Avg. screen time (hrs/day)",
          title = "User behavioural classes are directly proportional to screen time") +
    theme_classic()
}

relation_screen_time_to_app_no <- function(){
  ggplot(rdata) +
    geom_point(aes(x= number_of_apps_installed, y = screen_on_time_hours_day)) +
    labs( x = "Number of apps installed",
          y = "Screen time (hrs/day)",
          title = "Box clusters",
          subtitle = "possibly as it is not raw data") +
    theme_classic()
}

relation_screen_time_to_data <- function(){
  ggplot(rdata) +
    geom_point(aes(x= data_usage_mb_day, y = screen_on_time_hours_day)) +
    labs( x = "Data Usage (mb/day)",
          y = "Screen time (hrs/day)",
          title = "Box clusters",
          subtitle = "possibly as it is not raw data") +
    theme_classic()
}

relation_screen_time_to_app_time <- function(){
  ggplot(rdata) +
    geom_point(aes(x= app_usage_time_min_day/60, y = screen_on_time_hours_day)) +
    labs( x = "App usage (hrs/day)",
          y = "Screen time (hrs/day)",
          title = "Box clusters",
          subtitle = "possibly as it is not raw data") +
    theme_classic()
}


