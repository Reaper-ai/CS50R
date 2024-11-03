library("tidyverse")

data <- LifeCycleSavings
data <-data[order(-data$sr),]
data <- data[1:30,]

plt <- ggplot(data, aes(x = sr, y = row.names(data), color = dpi, shape = ddpi)) +
scale_shape_binned()+
geom_point() +
geom_vline(linetype=3,xintercept=mean(data$sr))+
annotate("text", x = mean(data$sr), y = 30, label = "Mean saving ratio", hjust=-0.08)+
labs( x = "aggregate personal savings",
      y = "Country",
      title="LifeCycleSavings Data of countries 1960-1970 ",
      shape = "per capita \ndisposable income",
      color = "growth rate \nof per capita \ndisposable income") +
theme_classic()


ggsave("visualization.png",plot=plt)
