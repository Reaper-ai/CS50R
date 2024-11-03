
relation_brand_to_data <- function(){
  ggplot(rdata) +
    geom_histogram(aes(x=data_usage_mb_day,group = brand, fill = brand)) +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_viridis_d()+
    labs( x= "Brands", y="Users",
          title = "Younger people use Oneplus less\nOlder people used iphone and Samsung more") +
    theme_classic()
}

relation_brand_to_ubc <- function(){
  ggplot(rdata) +
    geom_bar(aes(x=user_behavior_class,group = factor(brand),
                 fill = factor(brand))) +
    scale_fill_viridis_d() +
    labs( x= "USer Behaviour Class", y="Users",
          title = "Google,Xiaomi has most class 1\nIphone has most class 5 users",
          fill = "Brand") +
    theme_classic()
}

relation_brand_to_gender <- function(){
  ggplot(rdata) +
    geom_bar(aes(x=brand,group = gender, fill = gender), position = "fill") +
    scale_y_continuous(labels = scales::percent_format()) +
    labs( x= "Brands", y="Users",
          title = "Samsung,Oneplus is prefered by men\nwhile Xiaomi is used by women more") +
    theme_classic()
}

relation_brand_to_age <- function(){
  ggplot(rdata) +
    geom_bar(aes(x=brand,group = age, fill = age), position = "fill") +
    scale_y_continuous(labels = scales::percent_format()) +
    scale_fill_viridis_b()+
    labs( x= "Brands", y="Users",
          title = "Younger people use Oneplus less\nOlder people used iphone and Samsung more") +
    theme_classic()

}
