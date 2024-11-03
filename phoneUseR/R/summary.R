
rdata <- load_mydata()

# return distibution of brands among the users
summary_brands <- function(){
    plot_ <- rdata |>
    group_by(brand) |>
    summarise(count = n()) |>
    mutate(percentage = count / sum(count) * 100) |>
    ggplot(aes(x = "", y = count , group = brand, fill = brand)) +
    geom_bar( stat = "identity", width = 1, color = "white") +
    coord_polar("y",start = 0) +
    geom_text(aes(label = paste0(round(percentage, 1), "%")),
              position = position_stack(vjust = 0.5)) +
    labs(title = "Brand Distribution",
         fill = "") +
    theme_void() +
    theme(legend.position="bottom")


    return(plot_)
}

# gender distribution of the users
summary_gender <- function(){
  plot_ <- rdata |>
    group_by(gender) |>
    summarise(count = n()) |>
    mutate(percentage = count / sum(count) * 100) |>
    ggplot(aes(x = "", y = count , group = gender, fill = gender)) +
    geom_bar( stat = "identity", width = 1, color = "white") +
    coord_polar("y",start = 0) +
    geom_text(aes(label = paste0(round(percentage, 1), "%")),
              position = position_stack(vjust = 0.5)) +
    labs(title = "Gender Distribution",
         fill = "") +
    theme_void() +
    theme(legend.position="bottom")


  return(plot_)

}

# os distribution of users
summary_os <- function(){

  plot_ <- rdata |>
    group_by(operating_system) |>
    summarise(count = n()) |>
    mutate(percentage = count / sum(count) * 100) |>
    ggplot(aes(x = "", y = count , group = operating_system, fill = operating_system)) +
    geom_bar( stat = "identity", width = 1, color = "white") +
    coord_polar("y",start = 0) +
    geom_text(aes(label = paste0(round(percentage, 1), "%")),
              position = position_stack(vjust = 0.5)) +
    labs(title = "OS Distribution",
         fill = "") +
    theme_void() +
    theme(legend.position="bottom")

  return(plot_)
}

# user behavious classification
summary_ubc <- function(){
  plot_ <- rdata |>
    ggplot(aes( x = user_behavior_class,
                fill = user_behavior_class,
                group = user_behavior_class)) +
    geom_bar() +
    labs( title = "User Behaviour Class",
          x = "User Behaviour Class",
          y = "Number of users") +
    theme_classic() +
    theme(legend.position = "none")

  return(plot_)
}

# user daily data usage
summary_daily_usage <- function(){


  ggplot(rdata, aes(x = data_usage_mb_day)) +
    geom_histogram(aes(y=..density..),
                   fill="white",
                   color = "grey" ,
                   size=2) +
    geom_density(aes(y= ..density.. + 0.00015,
                     color= "red"), size = 1) +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(x = "Data Usage (mb/day)",
         y = "User count",
         title = "Data usage") +
    theme_classic() +
    theme( legend.position = "none") +
    annotate("label", x = 1250, y = 0.0007,
             label = paste0("mean : ", round(mean(rdata$data_usage_mb_day),2), " MB\n",
                            "median : ", round(median(rdata$data_usage_mb_day),2), " MB\n",
                            "standard deviation : ", round(sd(rdata$data_usage_mb_day),2)),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0)


}

# user daily battery usage
summary_battery_usage <- function(){
  ggplot(rdata) +
    geom_density(aes(x=battery_drain_m_ah_day, y = ..density.. - 1e-4),
                 color = "red", size = 2) +
    scale_y_continuous(labels = NULL)+
    labs( x = " Battery usages (mAh/day)",
          y = "No of USers",
          title = "Battery usage") +
    theme_classic() +
    annotate("label", x = 1000, y = 0.0001,
             label = paste0("mean : ", round(mean(rdata$battery_drain_m_ah_day),2), " mAh\n",
                            "median : ", round(median(rdata$battery_drain_m_ah_day),2), " mAh"),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0)

}

# user daily screen time
summary_screen_time <- function(){
  ggplot(rdata) +
    geom_density(aes(x=screen_on_time_hours_day), color = "red", size=2) +
    scale_y_continuous(labels = scales::percent_format()) +
    labs(title = "Screen time",
         x = "Screen time (hrs/day)",
         y = "No of users")+
    theme_classic() +
    annotate("label", x = 1, y = 0.05,
             label = paste0("mean : ", round(mean(rdata$screen_on_time_hours_day),2), " hrs\n",
                            "median : ", round(median(rdata$screen_on_time_hours_day),2), " hrs\n",
                            "standard deviation : ", round(sd(rdata$screen_on_time_hours_day),2)),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0)

}

# user daily app usage
summary_app_usage <- function(){
  ggplot(rdata) +
    geom_density(aes(x=app_usage_time_min_day), color = "red", size=2) +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_x_continuous(n.breaks = 6) +
    labs(title = "App time",
         x = "App usage time (min/day)",
         y = "No of users") +
    annotate("label", x = 10, y = 0.0001,
             label = paste0("mean : ", round(mean(rdata$app_usage_time_min_day),2), " min\n",
                            "median : ", round(median(rdata$app_usage_time_min_day),2), " min\n",
                            "standard deviation : ", round(sd(rdata$app_usage_time_min_day),2)),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0) +
    theme_classic()
}

# app installed
summary_apps <- function(){
  ggplot(rdata) +
    geom_histogram(aes(x = number_of_apps_installed),
                   color="blue", fill="lightblue") +
    labs(title="Number of apps installed",
         x = "No of apps installed",
         y = "No of users") +
    annotate("label", x = 70, y = 45,
             label = paste0("mean : ", round(mean(rdata$number_of_apps_installed),2), " apps\n",
                            "median : ", round(median(rdata$number_of_apps_installed),2), " apps"),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0) +
    theme_classic()
}

# user age distribution
summary_age <- function(){
  ggplot(rdata) +
    geom_histogram(aes(x=age), fill = "lightblue", color="blue") +
    labs(title="Age distribution of users",
         x = "Age" ,
         y = "Users") +
    annotate("label", x = 40, y = 45,
             label = paste0("mean : ", round(mean(rdata$age),2), "yrs\n",
                            "median : ", round(median(rdata$age),2), "yrs"),
             fill = "white", color = "black",
             label.size = 0.5, size = 4, hjust = 0) +
    theme_classic()
}

